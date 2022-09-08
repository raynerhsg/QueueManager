import '../entities/queue_entity.dart';

abstract class IQueueRepository {
  Stream<List<QueueEntity>> getAllQueue();

  Future<void> addQueue(QueueEntity queueEntity);

  Future<void> removeQueue(String id);

  Future<void> removeAllOrders();

  Future<void> updateQueue(QueueEntity queueEntity);
}
