

import '../../../../core/source/model/api_response.dart';
import '../../data/model/promotion_model.dart';
import '../../data/source/promotion_service.dart';

abstract class PromotionRepository {
  final PromotionService promotionService;

  PromotionRepository(this.promotionService);

  Future<Response<PromotionalModel?>?> promotionPass();
}
