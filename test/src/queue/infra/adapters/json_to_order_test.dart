import 'package:flutter_test/flutter_test.dart';
import 'package:queue_manager/src/queue/domain/value_objects/orders.dart';
import 'package:queue_manager/src/queue/infra/adapters/json_to_order.dart';

void main() {
  test(
    'deve converter um map em um objeto do tipo Order',
    () {
      final order = JsonToOrder.fromMap({
        'id': 'kahsdjk',
        'position': 1,
        'status': 'attending',
        'timestamp': '2022-03-31 18:37:30'
      });

      expect(order, isA<Order>());
      expect(order.status, OrderStatus.attending);
    },
  );

  test('deve converter um Order em map', () {
    final order = Order(
      position: 1,
      timeStamp: DateTime.now(),
      status: OrderStatus.waiting,
      id: 'asdsd',
    );

    final map = JsonToOrder.toMap(order);

    expect(map['id'], 'asdsd');
    expect(map['status'], 'waiting');
    expect(map['position'], 1);
  });
}
