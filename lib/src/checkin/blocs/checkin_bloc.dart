import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_manager/src/checkin/events/checkin_events.dart';
import 'package:queue_manager/src/checkin/states/checkin_states.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/usecases/generate_order.dart';
import 'package:queue_manager/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_manager/src/queue/domain/usecases/update_queue.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final IGetAllQueues getAllQueues;
  final IGenerateOrderUsecase generateOrderUsecase;
  final IUpdateQueue updateQueue;

  CheckinBloc(
    this.getAllQueues,
    this.generateOrderUsecase,
    this.updateQueue,
  ) : super(InitalCheckinState()) {
    on<FetchAllQueues>((event, emit) => _fetchAllQueus);
    on<PrintOrder>((event, emit) => _printOrder);
    on<GenerateOrder>((event, emit) => _generateOrder);
  }

  Future<void> _fetchAllQueus(event, Emitter emit) async {
    await emit.onEach<List<QueueEntity>>(getAllQueues.call(), onData: (queues) {
      emit(SucessCheckinState(queues));
    });
  }

  void _printOrder(PrintOrder event, emit) {}

  void _generateOrder(GenerateOrder event, emit) async {
    final queue = generateOrderUsecase.call(event.queueEntity);
    final order = queue.orders.last;
    await updateQueue.call(queue);
    emit(GeneratedOrderCheckinState(order));
  }
}
