import '../../domain/value_objects/orders.dart';

class JsonToOrder {
  static Order fromMap(dynamic json) {
    return Order(
      id: json['id'],
      position: json['position'],
      timeStamp: DateTime.parse(json['timestamp']),
      status: OrderStatus.values
          .firstWhere((element) => element.name == json['status']),
    );
  }

  static Map<String, dynamic> toMap(Order order) {
    return {
      'id': order.id,
      'position': order.position,
      'status': order.status.name,
      'timeStamp': order.timeStamp.toIso8601String(),
    };
  }
}
