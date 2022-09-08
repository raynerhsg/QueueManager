import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import '../value_objects/orders.dart';

abstract class IGenerateOrderUsecase {
  QueueEntity call(QueueEntity queueEntity);
}

//Implementação
class GenerateOrderUsecase extends IGenerateOrderUsecase {
  @override
  QueueEntity call(QueueEntity queueEntity) {
    // final orders = [...queueEntity.orders];
    final orders = List<Order>.from(queueEntity.orders);
    final totalOrders = queueEntity.orders.length;

    final order = Order(
      id: _generateId(totalOrders + 1),
      position: totalOrders + 1,
      status: OrderStatus.waiting,
      timeStamp: DateTime.now(),
    );

    orders.add(order);

    return QueueEntity(
      title: queueEntity.title,
      abbr: queueEntity.abbr,
      priority: queueEntity.priority,
      orders: orders,
      id: queueEntity.id,
    );
  }

  String _generateId(int id) {
    return '$id'.padLeft(4, '0');
  }
}
