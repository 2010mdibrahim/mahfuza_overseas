

import '../../../../core/source/model/api_response.dart';
import '../../data/model/candidate_service_info_model.dart';
import '../../data/source/candidate_service_info_service.dart';

abstract class CandidateServiceInfoRepository {
  final CandidateServiceInfoService candidateServiceInfoService;

  CandidateServiceInfoRepository(this.candidateServiceInfoService);

  Future<Response<CandidateServiceInfoModel?>?> candidateServiceInfoPass();
}
