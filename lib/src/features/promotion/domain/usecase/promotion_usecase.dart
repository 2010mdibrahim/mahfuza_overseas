import '../repository/promotion_repository.dart';

abstract class PromotionUseCase {
  final PromotionRepository promotionRepository;

  PromotionUseCase(this.promotionRepository);
}
