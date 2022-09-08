import 'package:queue_manager/src/queue/domain/repositories/queue_reposity.dart';

abstract class IUpdateQueue {
  Future<void> call(queueEntity);
}

class UpdateQueue extends IUpdateQueue {
  final IQueueRepository repository;
  UpdateQueue(this.repository);

  @override
  Future<void> call(queueEntity) async {
    return repository.updateQueue(queueEntity);
  }
}
