class Order {
  final String id;
  final int position;
  final DateTime timeStamp;
  final OrderStatus status;

  Order({
    required this.position,
    required this.timeStamp,
    required this.status,
    required this.id,
  });
}

enum OrderStatus { waiting, attending, notAnswered }
