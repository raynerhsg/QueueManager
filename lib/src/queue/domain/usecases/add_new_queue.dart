import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import '../repositories/queue_reposity.dart';

abstract class IAddNewQueues {
  Future<void> call(QueueEntity queueEntity);
}

class AddNewQueues implements IAddNewQueues {
  final IQueueRepository repository;

  AddNewQueues(this.repository);

  @override
  Future<void> call(QueueEntity queueEntity) async {
    return await repository.addQueue(queueEntity);
  }
}
