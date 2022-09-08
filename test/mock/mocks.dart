import 'package:mocktail/mocktail.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/repositories/queue_reposity.dart';
import 'package:queue_manager/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_manager/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_manager/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:queue_manager/src/queue/domain/usecases/remove_queue.dart';
import 'package:queue_manager/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

class IGetAllQueuesMock extends Mock implements IGetAllQueues {}

class IRemoveQueueMock extends Mock implements IRemoveQueue {}

class IAddQueueMock extends Mock implements IAddNewQueues {}

class IRemoveAllOrdersMock extends Mock implements IRemoveAllOrders {}
