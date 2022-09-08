import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/value_objects/orders.dart';

abstract class CheckinState {}

class LoadingCheckinState implements CheckinState {}

class SucessCheckinState implements CheckinState {
  final List<QueueEntity> queues;
  SucessCheckinState(this.queues);
}

class GeneratedOrderCheckinState implements CheckinState {
  final Order order;
  GeneratedOrderCheckinState(this.order);
}

class InitalCheckinState implements CheckinState {}

class ExceptionCheckinState implements CheckinState {
  final String message;
  ExceptionCheckinState(this.message);
}
