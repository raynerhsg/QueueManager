import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';

import '../../queue/domain/value_objects/orders.dart';

abstract class CheckinEvent {}

class FetchAllQueues implements CheckinEvent {}

class PrintOrder implements CheckinEvent {
  final Order order;
  PrintOrder(this.order);
}

class GenerateOrder implements CheckinEvent {
  final QueueEntity queueEntity;
  GenerateOrder(this.queueEntity);
}
