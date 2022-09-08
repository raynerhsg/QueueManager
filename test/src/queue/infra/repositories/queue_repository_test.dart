import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/infra/repositories/queue_repository.dart';

import '../../../../mock/mocks.dart';

void main() {
  test(
    'queue repository getAllQueue',
    () {
      final datasource = IQueueDatasourceMock();
      when(() => datasource.getAllQueue()).thenAnswer(
        (invocation) => Stream.value(
          [
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
          ],
        ),
      );

      final repository = QueueRepository(datasource: datasource);

      final result = repository.getAllQueue();

      expect(result, emits(isA<List<QueueEntity>>()));
    },
  );

  test('deve adicionar uma nova queue', () {
    final datasource = IQueueDatasourceMock();
    const queue = QueueEntity(
      abbr: 'ddd',
      orders: [],
      id: 'asdasd',
      title: 'dasd',
      priority: 1,
    );
    when(() => datasource.addQueue(any())).thenAnswer((_) => Future.value());
    final respository = QueueRepository(datasource: datasource);

    expect(respository.addQueue(queue), completes);
  });
}
