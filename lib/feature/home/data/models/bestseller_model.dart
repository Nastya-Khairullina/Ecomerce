import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/bestseller_entity.dart';

part 'bestseller_modelG.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BestSellerModel extends BestSellerEntity{
  const BestSellerModel({
    required int? id,
    required bool? isFavorites,
    required String? title,
    required int? priceWithoutDiscount,
    required int? discountPrice,
    required List<String>? picture,
  }) : super(
      id: id,
      isFavorites: isFavorites,
      title: title,
      priceWithoutDiscount: priceWithoutDiscount,
      discountPrice: discountPrice,
      picture: picture,
  ) ;

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
  factory BestSellerModel.fromJson(Map<String, dynamic> json) => _$BestSellerModelFromJson(json);
}