
import '../../../../core/source/model/api_response.dart';
import '../../data/model/agent_model.dart';
import '../../data/model/login_model.dart';
import 'login_usecase.dart';

class LoginWithIdPassUseCase extends LoginUseCase {
  LoginWithIdPassUseCase(super.loginRepository);

  Future<Response<LoginModel?>?> call(
      {required String userName, required String password}) async {
    var response = await loginRepository.loginWithIdPass(
        userName: userName, password: password);
    return response;
  }
}

class AgentBalanceModelPassUseCase extends LoginUseCase {
  AgentBalanceModelPassUseCase(super.loginRepository);

  Future<Response<AgentBalanceModel?>?> call(
      {required String id}) async {
    var response = await loginRepository.agentBalance(
        id: id);
    return response;
  }
}
