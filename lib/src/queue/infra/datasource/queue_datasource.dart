abstract class IQueueDatasource {
  Stream<List<Map>> getAllQueue();
  Future<void> addQueue(Map<String, dynamic> queueMap);

  Future<void> removeQueue(String id);

  Future<void> removeAllOrders();

  Future<void> updateQueue(Map<String, dynamic> queueEntity);
}
