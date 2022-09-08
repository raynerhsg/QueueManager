import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_manager/src/configuration/events/conf_event.dart';
import 'package:queue_manager/src/configuration/states/conf_state.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_manager/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_manager/src/queue/domain/usecases/remove_queue.dart';

import '../../queue/domain/usecases/remove_all_orders.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllQueuesUseCase;
  final IAddNewQueues addNewQueueUseCase;
  final IRemoveQueue removeQueueUseCase;
  final IRemoveAllOrders removeAllOrdersUseCase;

  ConfigurationBloc(
    this.getAllQueuesUseCase,
    this.addNewQueueUseCase,
    this.removeQueueUseCase,
    this.removeAllOrdersUseCase,
  ) : super(EmptyConfigurationState()) {
    on<FetchQueues>(_fetchQueues, transformer: restartable());
    //recebe o evento
    on<AddNewQueueEvent>(_addNewQueues, transformer: sequential());
    on<RemoveQueueEvent>(_removeQueue, transformer: restartable());
    on<RemoveAllOrdersEnvent>(_removeAllOrders, transformer: droppable());
  }

  //envia para o use case
  Future<void> _addNewQueues(AddNewQueueEvent event, emit) async {
    await addNewQueueUseCase.call(event.queue);
  }

  Future<void> _removeAllOrders(RemoveAllOrdersEnvent event, emit) async {
    await removeAllOrdersUseCase.call();
  }

  Future<void> _removeQueue(RemoveQueueEvent event, emit) async {
    await removeQueueUseCase.call(event.queue);
  }

  Future<void> _fetchQueues(event, Emitter emit) async {
    emit(LoadConfigurationState());
    await emit.onEach<List<QueueEntity>>(getAllQueuesUseCase.call(),
        onData: (queues) => emit(LoadedConfigurationState(queues)),
        onError: (error, st) {
          emit(ExceptionConfigurationState(error.toString()));
        });
  }
}
