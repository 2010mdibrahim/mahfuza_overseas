import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/notification_repository.dart';
import '../model/notification_model.dart';
import '../source/notification_service.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl(NotificationService promotionService) : super(promotionService);

  @override
  Future<Response<NotificationModel?>?> promotionPass() async {
    Response<NotificationModel>? apiResponse;
    apiResponse = await promotionService.promotionPass();
    return apiResponse;
  }
  @override
  Future<Response<ContactModel?>?> updateNotificationPass({String? updateNotificationId}) async {
    Response<ContactModel>? apiResponse;
    apiResponse = await promotionService.updateNotificationSeenPass(updateNotificationId: updateNotificationId);
    return apiResponse;
  }
}
