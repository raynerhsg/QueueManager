import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/repositories/queue_reposity.dart';
import 'package:queue_manager/src/queue/infra/adapters/json_to_queue.dart';
import 'package:queue_manager/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepository implements IQueueRepository {
  final IQueueDatasource datasource;
  QueueRepository({
    required this.datasource,
  });

  @override
  Stream<List<QueueEntity>> getAllQueue() {
    final stream = datasource.getAllQueue();

    return stream.map(_convert);
  }

  List<QueueEntity> _convert(List<Map> list) {
    return list.map(JsonToQueue.fromMap).toList();
  }

  @override
  Future<void> addQueue(QueueEntity queueEntity) async {
    final map = JsonToQueue.toMap(queueEntity);
    await datasource.addQueue(map);
  }

  @override
  Future<void> removeQueue(String id) async {
    await datasource.removeQueue(id);
  }

  @override
  Future<void> removeAllOrders() async {
    await datasource.removeAllOrders();
  }

  @override
  Future<void> updateQueue(QueueEntity queueEntity) async {
    final map = JsonToQueue.toMap(queueEntity);
    await datasource.updateQueue(map);
  }
}
