import 'package:queue_manager/src/queue/domain/repositories/queue_reposity.dart';

import '../entities/queue_entity.dart';

abstract class IGetAllQueues {
  Stream<List<QueueEntity>> call();
}

class GetAllQueues implements IGetAllQueues {
  final IQueueRepository repository;

  GetAllQueues(this.repository);

  @override
  Stream<List<QueueEntity>> call() {
    return repository.getAllQueue();
  }
}
