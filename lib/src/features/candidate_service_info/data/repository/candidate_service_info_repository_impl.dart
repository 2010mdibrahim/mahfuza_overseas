import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/candidate_service_info_repository.dart';
import '../model/candidate_service_info_model.dart';
import '../source/candidate_service_info_service.dart';

class CandidateServiceInfoRepositoryImpl extends CandidateServiceInfoRepository {
  CandidateServiceInfoRepositoryImpl(CandidateServiceInfoService candidateServiceInfoService) : super(candidateServiceInfoService);

  @override
  Future<Response<CandidateServiceInfoModel?>?> candidateServiceInfoPass() async {
    Response<CandidateServiceInfoModel>? apiResponse;
    apiResponse = await candidateServiceInfoService.candidateServiceInfoPass();
    return apiResponse;
  }
}
