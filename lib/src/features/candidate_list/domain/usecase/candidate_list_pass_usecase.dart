
import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../data/model/candidate_list_model.dart';
import 'candidate_list_usecase.dart';

class CandidateListModelPassUseCase extends CandidateListModelUseCase {
  CandidateListModelPassUseCase(super.candidateListModelRepository);

  Future<Response<CandidateListModel?>?> call({required String id}) async {
    var response = await candidateListModelRepository.candidateList(id);
    return response;
  }
}

