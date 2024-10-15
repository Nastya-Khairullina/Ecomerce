import 'package:equatable/equatable.dart';
import '../../domain/entity/basket_entity.dart';
import '../../domain/entity/cart_entity.dart';

abstract class CartState extends Equatable  {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {

  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  final List<CartEntity> loadedCart;
  final List<BasketEntity> loadedBasket;

  const CartLoadedState({
    required this.loadedCart,
    required this.loadedBasket,
  });

  @override
  List<Object?> get props => [loadedBasket, loadedCart];
}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}