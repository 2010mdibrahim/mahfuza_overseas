

import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../data/model/notification_model.dart';
import '../../data/source/notification_service.dart';

abstract class NotificationRepository {
  final NotificationService promotionService;

  NotificationRepository(this.promotionService);

  Future<Response<NotificationModel?>?> promotionPass();
  Future<Response<ContactModel?>?> updateNotificationPass({String? updateNotificationId});
}
