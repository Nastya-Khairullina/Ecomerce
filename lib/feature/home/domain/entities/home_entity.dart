import 'package:equatable/equatable.dart';
import '../../data/models/bestseller_model.dart';
import '../../data/models/homestore_model.dart';

class StoreEntity extends Equatable{
  final List<HomeStoreModel>? homeStore;
  final List<BestSellerModel>? bestSeller;

  const StoreEntity({
    required this.homeStore,
    required this.bestSeller,
  });

  @override
  List<Object?> get props => [homeStore, bestSeller];
}