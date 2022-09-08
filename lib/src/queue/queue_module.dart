import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue_manager/src/queue/domain/repositories/queue_reposity.dart';
import 'package:queue_manager/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_manager/src/queue/domain/usecases/generate_order.dart';
import 'package:queue_manager/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_manager/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:queue_manager/src/queue/domain/usecases/remove_queue.dart';
import 'package:queue_manager/src/queue/domain/usecases/update_queue.dart';
import 'package:queue_manager/src/queue/external%20/queue_firestore_datasource.dart';
import 'package:queue_manager/src/queue/infra/datasource/queue_datasource.dart';
import 'package:queue_manager/src/queue/infra/repositories/queue_repository.dart';

final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(create: (_) => QueueFirestoreDatasource(_.read())),
  Provider<IQueueRepository>(
      create: (_) => QueueRepository(datasource: _.read())),
  //usecases
  Provider<IGetAllQueues>(create: (_) => GetAllQueues(_.read())),
  Provider<IAddNewQueues>(create: (_) => AddNewQueues(_.read())),
  Provider<IRemoveQueue>(create: (_) => RemoveQueue(_.read())),
  Provider<IRemoveAllOrders>(create: (_) => RemoveAllOrders(_.read())),
  Provider<IGenerateOrderUsecase>(create: (_) => GenerateOrderUsecase()),
  Provider<IUpdateQueue>(create: (_) => UpdateQueue(_.read())),
];
