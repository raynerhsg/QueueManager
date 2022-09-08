import 'package:flutter_test/flutter_test.dart';
import 'package:queue_manager/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_manager/src/queue/domain/usecases/generate_order.dart';

void main() {
  test('deve gerar uma nova order ...', () async {
    final usecase = GenerateOrderUsecase();
    const queueEntity = QueueEntity(
      id: 'gsgsg',
      title: 'title',
      abbr: 'abbr',
      priority: 1,
      orders: [],
    );
    final result = usecase.call(queueEntity);

    expect(result.orders.length, 1);
    expect(result.orders.first.id, '0001');
    expect(result.orders.first.position, 1);
  });
}
