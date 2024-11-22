import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../../domain/entities/product_entity.dart';

class CartDataProvider extends ChangeNotifier  {
  static late List<ProductEntity> _items = [];
  UnmodifiableListView<ProductEntity> get items => UnmodifiableListView(_items);

  int _value = 0;


  void add (ProductEntity items) {
    _items.add(items);
    notifyListeners();
  }
  void deleteItem (ProductEntity items){
    _items.remove(_value);
    notifyListeners();
  }
  void clear() {
    _items = [];
    notifyListeners();
  }
}
