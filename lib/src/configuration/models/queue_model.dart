import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/value_objects/orders.dart';

class QueueModel extends QueueEntity {
  QueueModel({
    required super.title,
    required super.abbr,
    required super.priority,
    required super.orders,
    required super.id,
  });

  factory QueueModel.empty() => QueueModel(
        title: '',
        abbr: '',
        priority: 0,
        orders: [],
        id: '',
      );

  QueueModel copyWith({
    String? title,
    String? abbr,
    int? priority,
    List<Order>? orders,
    String? id,
  }) {
    return QueueModel(
      abbr: abbr ?? this.abbr,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      id: id ?? this.id,
      orders: orders ?? this.orders,
    );
  }
}
