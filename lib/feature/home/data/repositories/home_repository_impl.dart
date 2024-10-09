import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/bestseller_entity.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/entities/homestore_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remore_data.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestseller() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<HomeStoreEntity>>> getHomestore() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> getStore() async {
    try {
      final remoteHome = await homeRemoteDataSource.getStore();
      return Right(remoteHome);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}