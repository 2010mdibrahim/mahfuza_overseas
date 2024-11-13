
import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../data/model/agent_transaction_list_model.dart';
import 'agent_transaction_list_usecase.dart';

class AgentTransactionListModelPassUseCase extends AgentTransactionListModelUseCase {
  AgentTransactionListModelPassUseCase(super.agentTransactionListModelRepository);

  Future<Response<AgentTransactionListModel?>?> call({required String id}) async {
    var response = await agentTransactionListModelRepository.agentTransactionList(id);
    return response;
  }
}

