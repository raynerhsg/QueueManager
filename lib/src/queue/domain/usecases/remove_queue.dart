import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/repositories/queue_reposity.dart';

abstract class IRemoveQueue {
  Future<void> call(QueueEntity queueEntity);
}

class RemoveQueue implements IRemoveQueue {
  final IQueueRepository repository;

  RemoveQueue(this.repository);

  @override
  Future<void> call(QueueEntity queueEntity) async {
    await repository.removeQueue(queueEntity.id);
  }
}
