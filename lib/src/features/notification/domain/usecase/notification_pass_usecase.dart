
import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../data/model/notification_model.dart';
import 'notification_usecase.dart';

class NotificationPassUseCase extends NotificationUseCase {
  NotificationPassUseCase(super.notificationRepository);

  Future<Response<NotificationModel?>?> call() async {
    var response = await notificationRepository.promotionPass();
    return response;
  }
}

class NotificationUpdatePassUseCase extends NotificationUseCase {
  NotificationUpdatePassUseCase(super.notificationRepository);

  Future<Response<ContactModel?>?> call({String? updateNotificationId}) async {
    var response = await notificationRepository.updateNotificationPass(updateNotificationId: updateNotificationId);
    return response;
  }
}
