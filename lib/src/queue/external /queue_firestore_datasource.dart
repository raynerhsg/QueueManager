import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue_manager/src/queue/infra/datasource/queue_datasource.dart';

class QueueFirestoreDatasource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  QueueFirestoreDatasource(this.firestore);

  @override
  Stream<List<Map>> getAllQueue() {
    final ref = firestore.collection('queues');

    final snapshot = ref.orderBy('priority', descending: true).snapshots();

    return snapshot.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map((documents) => {
              'id': documents.id,
              ...documents.data(),
            })
        .toList();
  }

  @override
  Future<void> addQueue(Map<String, dynamic> map) async {
    final ref = firestore.collection('queues');
    // map = map.remove('id');
    // ref.add(map..remove('id'));
    map.remove('id');
    ref.add(map);
  }

  @override
  Future<void> removeQueue(String id) async {
    final ref = firestore.collection('queues');
    await ref.doc(id).delete();
  }

  @override
  Future<void> removeAllOrders() async {
    final ref = firestore.collection('queues');
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      final map = doc.data();
      map.remove('orders');
      await doc.reference.set(map);
    }
  }

  @override
  Future<void> updateQueue(Map<String, dynamic> map) async {
    final ref = firestore.collection('queues');
    final doc = ref.doc(map['id']);
    doc.set(map);
  }
}
