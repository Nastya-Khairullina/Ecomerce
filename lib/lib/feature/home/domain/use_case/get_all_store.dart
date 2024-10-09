import 'package:dartz/dartz.dart';
import 'package:untitled2/core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

class GetAllStoreUseCase extends UseCase<List<StoreEntity>, void> {
  final HomeRepository homeRepository;

  GetAllStoreUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<StoreEntity>>> call(void params) async {
    return await homeRepository.getStore()!;
  }
}