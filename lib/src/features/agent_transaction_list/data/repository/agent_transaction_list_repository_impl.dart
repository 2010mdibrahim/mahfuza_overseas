import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/agent_transaction_list_repository.dart';
import '../model/agent_transaction_list_model.dart';
import '../source/agent_transaction_list_service.dart';

class AgentTransactionListModelRepositoryImpl extends AgentTransactionListModelRepository {
  AgentTransactionListModelRepositoryImpl(AgentTransactionListModelService super.agentTransactionListModelService);

  @override
  Future<Response<AgentTransactionListModel?>?> agentTransactionList(String id) async {
    Response<AgentTransactionListModel>? apiResponse;
    apiResponse = await candidateListModelService.agentTransactionList(id);
    return apiResponse;
  }

}
