import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/home_entity.dart';
import 'bestseller_model.dart';
import 'homestore_model.dart';

part 'store_modelG.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StoreModel extends StoreEntity {
  const StoreModel({
    required List<HomeStoreModel>? homeStore,
    required List<BestSellerModel>? bestSeller,
  }) : super(
    homeStore: homeStore,
    bestSeller: bestSeller,
  );

  factory StoreModel.fromJson(Map<String, dynamic> json) => _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}