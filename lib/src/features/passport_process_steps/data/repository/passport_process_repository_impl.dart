import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/passport_process_repository.dart';
import '../model/passport_process_model.dart';
import '../source/passport_process_service.dart';

class PassportRepositoryImpl extends PassportRepository {
  PassportRepositoryImpl(PassportService passportService) : super(passportService);

  @override
  Future<Response<PassportProcessStepModel?>?> passportPass({String? candidateId}) async {
    Response<PassportProcessStepModel>? apiResponse;
    apiResponse = await passportService.passportPass(candidateId: candidateId);
    return apiResponse;
  }
}
