import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/bestseller_entity.dart';
import '../entities/home_entity.dart';
import '../entities/homestore_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<StoreEntity>>>? getStore();
  Future<Either<Failure, List<HomeStoreEntity>>>? getHomestore();
  Future<Either<Failure, List<BestSellerEntity>>>? getBestseller();
}