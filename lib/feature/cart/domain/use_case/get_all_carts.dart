import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/cart_entity.dart';
import '../repository/cart_repository.dart';

class GetAllCartsUseCase extends UseCase<List<CartEntity>, getAllCartsParams> {
  final CartRepository cartRepository;

  GetAllCartsUseCase(this.cartRepository);

  @override
  Future<Either<Failure, List<CartEntity>>> call(getAllCartsParams params) async {
    return await cartRepository.getAllCarts();
  }
}
class getAllCartsParams extends Equatable {
  final String query;

  const getAllCartsParams({required this.query});

  @override
  List<Object> get props => [query];
}