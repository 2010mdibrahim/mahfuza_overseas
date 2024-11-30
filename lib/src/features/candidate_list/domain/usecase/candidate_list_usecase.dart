import '../repository/candidate_list_repository.dart';

abstract class CandidateListModelUseCase {
  final CandidateListModelRepository candidateListModelRepository;

  CandidateListModelUseCase(this.candidateListModelRepository);
}
