import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_manager/src/queue/external%20/queue_firestore_datasource.dart';

void main() {
  test('queue firestore datasource getAllQueue', () async {
    final firestore = FakeFirebaseFirestore();

    await firestore.collection('queue').add(
      {
        'id': 'kahsdjk',
        'title': 'title',
        'priority': 1,
        'abbr': 'sd',
        'orders': [
          {
            'id': 'kahsdjk',
            'position': 1,
            'status': 'attending',
            'timestamp': '2022-03-31 18:37:30'
          },
        ],
      },
    );
    final datasource = QueueFirestoreDatasource(firestore);

    final result = datasource.getAllQueue();

    expect(result, emits(isA<List<Map>>()));
  });

  test('deve adicionar um novo item ao collection queue', () async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDatasource(firestore);
    await datasource.addQueue({
      'id': 'kjhasdkj',
      'title': 'novo titulo',
      'abbr': 'nt',
      'priority': 2,
    });

    final ref = firestore.collection('queues');
    final queries = await ref.get();
    expect(queries.docs.length, 1);
    expect(queries.docs.first['title'], 'novo titulo');
    expect(queries.docs.first.data().containsKey('id'), false);
  });

  test(
    'deve remover a propriedade orders de todos os documentos',
    () async {
      final firestore = FakeFirebaseFirestore();
      final datasource = QueueFirestoreDatasource(firestore);
      await datasource.addQueue({
        'id': 'kjhasdkj',
        'title': 'novo titulo',
        'abbr': 'nt',
        'priority': 2,
        'orders': [],
      });
      await datasource.addQueue({
        'id': 'kjhasdkj2',
        'title': 'novo titulo2',
        'abbr': 'nt2',
        'priority': 3,
        'orders': [],
      });

      await datasource.removeAllOrders();
      final ref = firestore.collection('queues');
      final queries = await ref.get();
      expect(queries.docs.first.data().containsKey('orders'), false);
      expect(queries.docs.last.data().containsKey('orders'), false);
    },
  );

  test(
    'deve atualizar a queue',
    () async {
      final firestore = FakeFirebaseFirestore();
      final datasource = QueueFirestoreDatasource(firestore);

      await datasource.addQueue({
        'id': 'kjhasdkj',
        'title': 'novo titulo',
        'abbr': 'nt',
        'priority': 2,
        'orders': [],
      });

      await datasource.updateQueue({
        'id': 'kjhasdkj',
        'title': 'novo titulo',
        'abbr': 'nt',
        'priority': 3,
        'orders': [
          {
            'position': 1,
            'id': '0001',
            'status': 'waiting',
          }
        ],
      });

      final ref = firestore.collection('queues');
      final queue = await ref.doc('kjhasdkj').get();

      expect((queue.data()?['orders'] as List).length, 1);
      expect(queue.data()?['priority'], 3);
    },
  );
}
