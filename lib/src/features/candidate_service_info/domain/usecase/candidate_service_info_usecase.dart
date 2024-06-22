import '../repository/candidate_service_info_repository.dart';

abstract class CandidateServiceInfoUseCase {
  final CandidateServiceInfoRepository candidateServiceInfoRepository;

  CandidateServiceInfoUseCase(this.candidateServiceInfoRepository);
}
