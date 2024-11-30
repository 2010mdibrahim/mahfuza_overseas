

import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../data/model/agent_transaction_list_model.dart';
import '../../data/source/agent_transaction_list_service.dart';

abstract class AgentTransactionListModelRepository {
  final AgentTransactionListModelService candidateListModelService;

  AgentTransactionListModelRepository(this.candidateListModelService);

  Future<Response<AgentTransactionListModel?>?> agentTransactionList(String id);
}
