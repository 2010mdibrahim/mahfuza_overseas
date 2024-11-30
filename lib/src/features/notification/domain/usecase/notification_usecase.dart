import '../repository/notification_repository.dart';

abstract class NotificationUseCase {
  final NotificationRepository notificationRepository;

  NotificationUseCase(this.notificationRepository);
}
