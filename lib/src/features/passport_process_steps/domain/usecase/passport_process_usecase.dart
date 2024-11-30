import '../repository/passport_process_repository.dart';

abstract class PassportUseCase {
  final PassportRepository passportRepository;

  PassportUseCase(this.passportRepository);
}
