
import '../../../../core/source/model/api_response.dart';
import '../../data/model/employee_attendance_model.dart';
import 'employee_attendance_usecase.dart';

class EmployeeAttendancePassUseCase extends EmployeeAttendanceUseCase {
  EmployeeAttendancePassUseCase(super.employeeAttendanceRepository);

  Future<Response<EmployeeAttendanceModel?>?> call({required String employeeId, required String year}) async {
    var response = await employeeAttendanceRepository.employeeAttendancePass(employeeId: employeeId , year: year);
    return response;
  }
}
