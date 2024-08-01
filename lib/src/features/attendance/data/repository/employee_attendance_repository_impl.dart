import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/employee_attendance_repository.dart';
import '../model/employee_attendance_model.dart';
import '../source/employee_attendance_service.dart';

class EmployeeAttendanceRepositoryImpl extends EmployeeAttendanceRepository {
  EmployeeAttendanceRepositoryImpl(EmployeeAttendanceService employeeAttendanceService) : super(employeeAttendanceService);

  @override
  Future<Response<EmployeeAttendanceModel?>?> employeeAttendancePass({required String employeeId, required String year}) async {
    Response<EmployeeAttendanceModel>? apiResponse;
    apiResponse = await employeeAttendanceService.employeeAttendancePass(employeeId: employeeId , year: year);
    return apiResponse;
  }
}
