import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/cart_entity.dart';
import 'basket_model.dart';
part 'cart_modelG.dart';

@JsonSerializable()
class CartModel extends CartEntity{
  const CartModel({
    required List<BasketModel>? basket,
    required String? delivery,
    required String? id,
    required int? total,
  }) : super(
    id: id,
    delivery: delivery,
    total: total,
    basket: basket,
  );

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}