import 'package:flutter/material.dart';
import 'package:mahfuza_overseas/src/core/routes/route_name.dart';
import 'package:mahfuza_overseas/src/features/candidate_service_info/ui/presentation/passport_renew.dart';
import 'package:mahfuza_overseas/src/features/contact_page/contact_page.dart';
import 'package:mahfuza_overseas/src/features/notification/ui/presentation/notification_screen.dart';

import '../../features/agent_transaction_list/ui/presentation/agent_transaction_list_screen.dart';
import '../../features/attendance/presentation/view/attendance_screen.dart';
import '../../features/candidate_list/ui/presentation/candidate_list_screen.dart';
import '../../features/candidate_service_info/ui/presentation/services_screen.dart';
import '../../features/dashboard_screen/dashboard_screen.dart';
import '../../features/login_screen/ui/presentation/login_screen.dart';
import '../../features/passport_process_steps/ui/presentation/passport_process_step.dart';
import '../../features/splash_screen/splash_screen.dart';


class RouteGenerator {
  static pushNamed(BuildContext context, String pageName, {dynamic arguments}) {
    return Navigator.pushNamed(context, pageName, arguments: arguments);
  }

  Future<dynamic> pushNamedSms(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushNamed(context, pageName, arguments: arguments);
  }

  static pushNamedforAdvanceSearch(
      BuildContext context, String pageName, Function filterActionEvent) {
    return Navigator.of(context).pushNamed(pageName);
  }

  static pushNamedAndRemoveAll(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushNamedAndRemoveUntil(
        context, pageName, (route) => false,
        arguments: arguments);
  }

  static pushReplacementNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushReplacementNamed(context, pageName,
        arguments: arguments);
  }

  static pop(BuildContext context) {
    return Navigator.of(context).pop();
  }
  static popAndPushNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.popAndPushNamed(context, pageName, arguments: arguments);
  }

  static popAll(BuildContext context) {
    return Navigator.of(context).popUntil((route) => false);
  }

  static popUntil(BuildContext context, String pageName) {
    return Navigator.of(context).popUntil(ModalRoute.withName(pageName));
  }

  // ================================== Routing =============================================

  static Route<dynamic>? onRouteGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
        case Routes.dashboard:

        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
        case Routes.passportProcessingStepsScreen:
          final arguments = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (context) =>  PassportProcessingStepsScreen(
            candidateId: arguments[0] as String,
          ),
        );
        case Routes.servicesScreen:
        return MaterialPageRoute(
          builder: (context) => const ServicesScreen(),
        );
        case Routes.candidateList:
        return MaterialPageRoute(
          builder: (context) => const CandidateListScreen(),
        );
        case Routes.passportRenew:
        return MaterialPageRoute(
          builder: (context) => const PassportRenewScreen(),
        );
        case Routes.notificationPage:
        return MaterialPageRoute(
          builder: (context) =>  NotificationScreen(),
        );
        case Routes.attendance:
        return MaterialPageRoute(
          builder: (context) =>  AttendanceScreen(),
        );
        case Routes.agentTransactionListScreen:
        return MaterialPageRoute(
          builder: (context) =>  AgentTransactionListScreen(),
        );
      }
    return null;
  }
}
