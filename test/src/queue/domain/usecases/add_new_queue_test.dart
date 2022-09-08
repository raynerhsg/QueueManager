import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_manager/src/queue/domain/usecases/add_new_queue.dart';
import '../../../../mock/mocks.dart';

void main() {
  test('deve adicionar uma nova queue entity', () {
    final repository = QueueRepositoryMock();
    final queue = QueueEntityMock();

    when(() => repository.addQueue(queue)).thenAnswer((_) => Future.value());
    final usecase = AddNewQueues(repository);

    expect(usecase.call(queue), completes);
  });
}
