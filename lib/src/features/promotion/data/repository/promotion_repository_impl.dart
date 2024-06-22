import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/promotion_repository.dart';
import '../model/promotion_model.dart';
import '../source/promotion_service.dart';

class PromotionRepositoryImpl extends PromotionRepository {
  PromotionRepositoryImpl(PromotionService promotionService) : super(promotionService);

  @override
  Future<Response<PromotionalModel?>?> promotionPass() async {
    Response<PromotionalModel>? apiResponse;
    apiResponse = await promotionService.promotionPass();
    return apiResponse;
  }
}
