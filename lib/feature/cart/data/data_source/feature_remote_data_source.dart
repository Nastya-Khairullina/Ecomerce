import 'dart:convert';
import '../../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getCarts();
  Future<List<CartModel>> getBaskets();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CartModel>> getCarts() => _getCartFromUrl(cartUrl);

  @override
  Future<List<CartModel>> getBaskets() => _getCartFromUrl(cartUrl);

  Future<List<CartModel>> _getCartFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final jsonCart = json.decode(response.body) as Map<String, dynamic>;
      List<CartModel> list = [];
      CartModel resposse = CartModel.fromJson(jsonCart);
      list.add(resposse);
      return list;
    } else {
      throw ServerException();
    }
  }
}