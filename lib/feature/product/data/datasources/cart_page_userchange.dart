import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../../domain/entities/product_entity.dart';

class CartDataProvider extends ChangeNotifier  {
  static late List<ProductEntity> _items = [];
  UnmodifiableListView<ProductEntity> get items => UnmodifiableListView(_items);

  int index = 0;


  void add (ProductEntity items) {
    _items.add(items);
  }
  void deleteItem (ProductEntity items){
    _items.remove([index]);
  }
  void clear() {
    _items = [];
  }
}
