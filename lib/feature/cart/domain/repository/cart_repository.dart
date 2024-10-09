import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/basket_entity.dart';
import '../entity/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getAllCarts();
  Future<Either<Failure, List<BasketEntity>>> getAllBaskets();
}