import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mahfuza_overseas/src/core/contacts/ui/contact_controller/contact_controller.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/dashboard_controller.dart';
import 'package:mahfuza_overseas/src/features/passport_process_steps/ui/controller/passport_process_step_controller.dart';
import 'package:mahfuza_overseas/src/features/splash_screen/splash_controller.dart';
import '../../features/agent_transaction_list/data/repository/agent_transaction_list_repository_impl.dart';
import '../../features/agent_transaction_list/data/source/agent_transaction_list_service.dart';
import '../../features/agent_transaction_list/domain/repository/agent_transaction_list_repository.dart';
import '../../features/agent_transaction_list/ui/controller/agent_transaction_list_controller.dart';
import '../../features/attendance/data/repository/employee_attendance_repository_impl.dart';
import '../../features/attendance/data/source/employee_attendance_service.dart';
import '../../features/attendance/domain/repository/employee_attendance_repository.dart';
import '../../features/attendance/presentation/controller/attendance_controller.dart';
import '../../features/candidate_list/data/repository/candidate_list_repository_impl.dart';
import '../../features/candidate_list/data/source/candidate_list_service.dart';
import '../../features/candidate_list/domain/repository/candidate_list_repository.dart';
import '../../features/candidate_list/ui/controller/candidate_list_controller.dart';
import '../../features/candidate_service_info/data/repository/candidate_service_info_repository_impl.dart';
import '../../features/candidate_service_info/data/source/candidate_service_info_service.dart';
import '../../features/candidate_service_info/domain/repository/candidate_service_info_repository.dart';
import '../../features/candidate_service_info/ui/controller/candidate_service_info_controller.dart';
import '../../features/login_screen/data/repository/login_repository_impl.dart';
import '../../features/login_screen/data/source/login_service.dart';
import '../../features/login_screen/domain/repository/login_repository.dart';
import '../../features/login_screen/ui/controller/login_controller.dart';
import '../../features/notification/data/repository/notification_repository_impl.dart';
import '../../features/notification/data/source/notification_service.dart';
import '../../features/notification/domain/repository/notification_repository.dart';
import '../../features/notification/ui/controller/notification_controller.dart';
import '../../features/passport_process_steps/data/repository/passport_process_repository_impl.dart';
import '../../features/passport_process_steps/data/source/passport_process_service.dart';
import '../../features/passport_process_steps/domain/repository/passport_process_repository.dart';
import '../../features/promotion/data/repository/promotion_repository_impl.dart';
import '../../features/promotion/data/source/promotion_service.dart';
import '../../features/promotion/domain/repository/promotion_repository.dart';
import '../../features/promotion/ui/controller/promotion_controller.dart';
import '../contacts/data/repository/contact_repository_impl.dart';
import '../contacts/data/source/contact_service.dart';
import '../contacts/domain/repository/contact_repository.dart';
import '../network/configuration.dart';
import '../source/dio_client.dart';
import '../source/pref_manager.dart';
import '../source/session_manager.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<Dio>(
      () => Dio()..interceptors.add(InterceptorsWrapper()));
  locator.registerFactory<DioClient>(() => DioClient(locator<Dio>()));
  //login
  locator.registerFactory<LoginController>(() => Get.put(LoginController()));
  locator.registerFactory<SignInService>(() => SignInService());
  locator.registerFactory<SignInRepository>(
      () => SignInRepositoryImpl(locator<SignInService>()));
  //passport process steps
  locator.registerFactory<PassportProcessStepController>(() => Get.put(PassportProcessStepController()));
  locator.registerFactory<PassportService>(() => PassportService());
  locator.registerFactory<PassportRepository>(
      () => PassportRepositoryImpl(locator<PassportService>()));

  //Candidate Service Info
  locator.registerFactory<CandidateServiceInfoController>(() => Get.put(CandidateServiceInfoController()));
  locator.registerFactory<CandidateServiceInfoService>(() => CandidateServiceInfoService());
  locator.registerFactory<CandidateServiceInfoRepository>(
      () => CandidateServiceInfoRepositoryImpl(locator<CandidateServiceInfoService>()));

  //Contact
  locator.registerFactory<ContactController>(() => Get.put(ContactController()));
  locator.registerFactory<ContactService>(() => ContactService());
  locator.registerFactory<ContactRepository>(
      () => ContactRepositoryImpl(locator<ContactService>()));

  //promotion
  locator.registerFactory<PromotionController>(() => Get.put(PromotionController()));
  locator.registerFactory<PromotionService>(() => PromotionService());
  locator.registerFactory<PromotionRepository>(
      () => PromotionRepositoryImpl(locator<PromotionService>()));

  //notification
  locator.registerFactory<NotificationController>(() => Get.put(NotificationController()));
  locator.registerFactory<NotificationService>(() => NotificationService());
  locator.registerFactory<NotificationRepository>(
      () => NotificationRepositoryImpl(locator<NotificationService>()));
  //attendance
  locator.registerFactory<EmployeeAttendanceController>(() => Get.put(EmployeeAttendanceController()));
  locator.registerFactory<EmployeeAttendanceService>(() => EmployeeAttendanceService());
  locator.registerFactory<EmployeeAttendanceRepository>(
      () => EmployeeAttendanceRepositoryImpl(locator<EmployeeAttendanceService>()));
  //candidate list
  locator.registerFactory<CandidateListController>(() => Get.put(CandidateListController()));
  locator.registerFactory<CandidateListModelService>(() => CandidateListModelService());
  locator.registerFactory<CandidateListModelRepository>(
      () => CandidateListRepositoryImpl(locator<CandidateListModelService>()));
  //agent transaction list
  locator.registerFactory<AgentTransactionListModelController>(() => Get.put(AgentTransactionListModelController()));
  locator.registerFactory<AgentTransactionListModelService>(() => AgentTransactionListModelService());
  locator.registerFactory<AgentTransactionListModelRepository>(
      () => AgentTransactionListModelRepositoryImpl(locator<AgentTransactionListModelService>()));

//splash screen controller
  locator.registerFactory<SplashScreenController>(() => Get.put(SplashScreenController()));
  //session

}
