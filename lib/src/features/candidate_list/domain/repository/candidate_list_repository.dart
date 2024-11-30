

import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../data/model/candidate_list_model.dart';
import '../../data/source/candidate_list_service.dart';

abstract class CandidateListModelRepository {
  final CandidateListModelService candidateListModelService;

  CandidateListModelRepository(this.candidateListModelService);

  Future<Response<CandidateListModel?>?> candidateList(String id);
}
