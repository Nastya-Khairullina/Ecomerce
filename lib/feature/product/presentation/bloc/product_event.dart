part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable{
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class ProductLoadEvent extends ProductEvent {

  const ProductLoadEvent(this.productQuery);
  final String productQuery;

  @override
  List<Object?> get props => throw UnimplementedError();

}
