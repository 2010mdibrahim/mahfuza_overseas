

import '../../../../core/source/model/api_response.dart';
import '../../data/model/passport_process_model.dart';
import '../../data/source/passport_process_service.dart';

abstract class PassportRepository {
  final PassportService passportService;

  PassportRepository(this.passportService);

  Future<Response<PassportProcessStepModel?>?> passportPass({String? candidateId});
}
