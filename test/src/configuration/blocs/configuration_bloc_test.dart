import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_manager/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue_manager/src/configuration/events/conf_event.dart';
import 'package:queue_manager/src/configuration/states/conf_state.dart';
import '../../../mock/mocks.dart';

void main() {
  final entity = QueueEntityMock();

  late IGetAllQueuesMock getAll;
  late IRemoveQueueMock remove;
  late IAddQueueMock addNew;
  late IRemoveAllOrdersMock removeAll;
  late ConfigurationBloc bloc;

  setUp(
    () {
      getAll = IGetAllQueuesMock();
      remove = IRemoveQueueMock();
      addNew = IAddQueueMock();
      removeAll = IRemoveAllOrdersMock();
      bloc = ConfigurationBloc(getAll, addNew, remove, removeAll);
    },
  );

  blocTest<ConfigurationBloc, ConfigurationState>('fetch queueres test',
      build: () {
        when(() => getAll.call()).thenAnswer((_) => Stream.value([]));

        return bloc;
      },
      act: (bloc) => bloc.add(FetchQueues()),
      expect: () => [
            isA<LoadConfigurationState>(),
            isA<LoadedConfigurationState>(),
          ]);

  blocTest<ConfigurationBloc, ConfigurationState>('add new query test',
      build: () {
        when(() => addNew.call(entity)).thenAnswer((_) => Future.value());

        return bloc;
      },
      act: (bloc) => bloc.add(AddNewQueueEvent(entity)),
      expect: () => []);

  blocTest<ConfigurationBloc, ConfigurationState>('remove query test',
      build: () {
        when(() => remove.call(entity)).thenAnswer((_) => Future.value());

        return bloc;
      },
      act: (bloc) => bloc.add(RemoveQueueEvent(entity)),
      expect: () => []);

  blocTest<ConfigurationBloc, ConfigurationState>(
      'fetch queueres with error test',
      build: () {
        when(() => getAll.call())
            .thenAnswer((_) => Stream.error(Exception('Error')));

        return bloc;
      },
      act: (bloc) => bloc.add(FetchQueues()),
      expect: () => [
            isA<LoadConfigurationState>(),
            isA<ExceptionConfigurationState>(),
          ]);
}
