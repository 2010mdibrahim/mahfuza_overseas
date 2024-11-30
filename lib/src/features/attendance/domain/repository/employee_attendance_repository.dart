

import '../../../../core/source/model/api_response.dart';
import '../../data/model/employee_attendance_model.dart';
import '../../data/source/employee_attendance_service.dart';

abstract class EmployeeAttendanceRepository {
  final EmployeeAttendanceService employeeAttendanceService;

  EmployeeAttendanceRepository(this.employeeAttendanceService);

  Future<Response<EmployeeAttendanceModel?>?> employeeAttendancePass({required String employeeId, required String year});
}
