import '../repository/agent_transaction_list_repository.dart';

abstract class AgentTransactionListModelUseCase {
  final AgentTransactionListModelRepository agentTransactionListModelRepository;

  AgentTransactionListModelUseCase(this.agentTransactionListModelRepository);
}
