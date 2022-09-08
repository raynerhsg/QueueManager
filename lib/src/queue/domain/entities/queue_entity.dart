import '../value_objects/orders.dart';

class QueueEntity {
  final String id;
  final String title;
  final String abbr;
  final int priority;
  final List<Order> orders;

  const QueueEntity({
    required this.title,
    required this.abbr,
    required this.priority,
    required this.orders,
    required this.id,
  });
}
