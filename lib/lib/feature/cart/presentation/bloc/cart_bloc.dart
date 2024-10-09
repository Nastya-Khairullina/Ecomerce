import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/basket_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/use_case/get_all_carts.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartsUseCase getAllCartUseCase;

  CartBloc({required this.getAllCartUseCase}) : super(CartLoadingState()) {
    on<CartLoadEvent>((event, emit) async {
      emit(CartLoadingState());
      List<BasketEntity> _loadedBasketList = [];
      final _loadedCartList = await getAllCartUseCase(getAllCartsParams (query: event.cartQuery));
      List<CartEntity> _cartList = [];

      _loadedCartList.fold((l) => emit(const CartErrorState(message: 'error')),
              (r) => _cartList.addAll(r));

      _loadedBasketList = _cartList.map<List<BasketEntity>>((e) => e.basket!).expand((element) => element).toList();
      emit(CartLoadedState(loadedBasket: _loadedBasketList, loadedCart: _cartList, /* countItems: countItems */));
    });
  }
}