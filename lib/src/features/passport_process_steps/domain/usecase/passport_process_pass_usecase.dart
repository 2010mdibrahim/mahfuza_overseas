
import '../../../../core/source/model/api_response.dart';
import '../../data/model/passport_process_model.dart';
import 'passport_process_usecase.dart';

class PassportPassUseCase extends PassportUseCase {
  PassportPassUseCase(super.passportRepository);

  Future<Response<PassportProcessStepModel?>?> call() async {
    var response = await passportRepository.passportPass();
    return response;
  }
}
