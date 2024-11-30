
import '../../../../core/source/model/api_response.dart';
import '../../data/model/promotion_model.dart';
import 'promotion_usecase.dart';

class NotificationPassUseCase extends PromotionUseCase {
  NotificationPassUseCase(super.promotionRepository);

  Future<Response<PromotionalModel?>?> call() async {
    var response = await promotionRepository.promotionPass();
    return response;
  }
}
