import '../repository/employee_attendance_repository.dart';

abstract class EmployeeAttendanceUseCase {
  final EmployeeAttendanceRepository employeeAttendanceRepository;

  EmployeeAttendanceUseCase(this.employeeAttendanceRepository);
}
