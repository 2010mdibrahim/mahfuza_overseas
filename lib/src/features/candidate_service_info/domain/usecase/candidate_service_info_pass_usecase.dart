
import '../../../../core/source/model/api_response.dart';
import '../../data/model/candidate_service_info_model.dart';
import 'candidate_service_info_usecase.dart';

class CandidateServiceInfoPassUseCase extends CandidateServiceInfoUseCase {
  CandidateServiceInfoPassUseCase(super.candidateServiceInfoRepository);

  Future<Response<CandidateServiceInfoModel?>?> call() async {
    var response = await candidateServiceInfoRepository.candidateServiceInfoPass();
    return response;
  }
}
