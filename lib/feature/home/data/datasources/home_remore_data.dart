import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/store_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<StoreModel>> getStore();
  Future<List<StoreModel>> getHomestore();
  Future<List<StoreModel>> getBestseller();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<StoreModel>> getBestseller() => _getHomeFromUrl(homeUrl);

  @override
  Future<List<StoreModel>> getHomestore() => _getHomeFromUrl(homeUrl);

  @override
  Future<List<StoreModel>> getStore() => _getHomeFromUrl(homeUrl);

  Future<List<StoreModel>> _getHomeFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final jsonHome = json.decode(response.body) as Map<String, dynamic>;
      List<StoreModel> list = [];
      StoreModel resposse = StoreModel.fromJson(jsonHome);
      list.add(resposse);
      return list;
    } else {
      throw ServerException();
    }
  }
}