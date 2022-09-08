import 'package:flutter_test/flutter_test.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/value_objects/orders.dart';
import 'package:queue_manager/src/queue/infra/adapters/json_to_queue.dart';

void main() {
  test(
    'deve converter um map em um objeto do tipo QueueEntity',
    () {
      final queue = JsonToQueue.fromMap(
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

      expect(queue, isA<QueueEntity>());
      expect(queue.title, 'title');
      expect(queue.priority, 1);
      expect(queue.orders.first.status, OrderStatus.attending);
    },
  );

  test('deve converter um QueueEntity em map', () {
    final order = Order(
      position: 1,
      timeStamp: DateTime.now(),
      status: OrderStatus.waiting,
      id: 'asdsd',
    );

    final queue = QueueEntity(
      title: 'title',
      abbr: 'abbr',
      priority: 1,
      orders: [order],
      id: 'asdasd',
    );

    final map = JsonToQueue.toMap(queue);

    expect(map['id'], 'asdasd');
    expect(map['title'], 'title');
    expect(map['orders'][0]['status'], 'waiting');
  });
}
