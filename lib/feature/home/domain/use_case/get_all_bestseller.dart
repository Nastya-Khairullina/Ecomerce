import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/bestseller_entity.dart';
import '../repositories/home_repository.dart';

class GetAllBestsellerUseCase extends UseCase<List<BestSellerEntity>, void> {
  final HomeRepository bestsellerRepository;

  GetAllBestsellerUseCase(this.bestsellerRepository);

  @override
  Future<Either<Failure, List<BestSellerEntity>>> call (void params) async {
    return await bestsellerRepository.getBestseller()!;
  }
}