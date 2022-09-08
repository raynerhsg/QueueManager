import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/usecases/get_all_queues.dart';
import '../../../../mock/mocks.dart';

void main() {
  test(
    'deve retornar uma lista de QueueEntity',
    () {
      final repository = QueueRepositoryMock();
      final entity = QueueEntityMock();
      when(() => repository.getAllQueue())
          .thenAnswer((_) => Stream.value([entity]));
      final usecase = GetAllQueues(repository);

      final result = usecase.call();

      expect(result, emits(isA<List<QueueEntity>>()));
    },
  );
}
