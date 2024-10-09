import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/basket_entity.dart';
import '../repository/cart_repository.dart';

class GetAllBasketsUseCase extends UseCase<List<BasketEntity>, void> {
  final CartRepository cartRepository;

  GetAllBasketsUseCase(this.cartRepository);

  @override
  Future<Either<Failure, List<BasketEntity>>> call(void params) async => await
  cartRepository.getAllBaskets();
}