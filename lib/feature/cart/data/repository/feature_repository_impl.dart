import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/basket_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/repository/cart_repository.dart';
import '../data_source/feature_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
   final CartRemoteDataSource cartRemoteDataSource;

   CartRepositoryImpl({required this.cartRemoteDataSource});

   @override
   Future<Either<Failure, List<BasketEntity>>> getAllBaskets() {
      throw UnimplementedError();
   }

   @override
   Future<Either<Failure, List<CartEntity>>> getAllCarts() async {
      try {
         final remoteCart = await cartRemoteDataSource.getCarts();
         return Right(remoteCart);
      } on ServerException {
         return Left(ServerFailure());
      }
   }
}