import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/candidate_list_repository.dart';
import '../model/candidate_list_model.dart';
import '../source/candidate_list_service.dart';

class CandidateListRepositoryImpl extends CandidateListModelRepository {
  CandidateListRepositoryImpl(CandidateListModelService candidateListModelService) : super(candidateListModelService);

  @override
  Future<Response<CandidateListModel?>?> candidateList(String id) async {
    Response<CandidateListModel>? apiResponse;
    apiResponse = await candidateListModelService.candidateList(id);
    return apiResponse;
  }

}
