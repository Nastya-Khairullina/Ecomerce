

import 'package:get_it/get_it.dart';

import 'feature/cart/data/data_source/feature_remote_data_source.dart';
import 'feature/cart/data/repository/feature_repository_impl.dart';
import 'feature/cart/domain/repository/cart_repository.dart';
import 'feature/cart/domain/use_case/get_all_carts.dart';
import 'feature/cart/presentation/bloc/cart_bloc.dart';
import 'feature/home/data/datasources/home_remore_data.dart';
import 'feature/home/data/repositories/home_repository_impl.dart';
import 'feature/home/domain/repositories/home_repository.dart';
import 'feature/home/domain/use_case/get_all_store.dart';
import 'feature/home/presentation/bloc/home_bloc.dart';
import 'feature/product/data/datasources/product_remote_datasources.dart';
import 'feature/product/data/repositories/product_repository_impl.dart';
import 'feature/product/domain/repositories/product_repository.dart';
import 'feature/product/domain/use_cases/product_usecase.dart';
import 'feature/product/presentation/bloc/product_bloc.dart';
import 'package:http/http.dart' as http;


GetIt injection = GetIt.instance;

Future<void> initializeDependencies() async {
  injection.registerFactory(() => HomeBloc(getAllStoreUseCase: injection()));
  injection.registerFactory(() => CartBloc(getAllCartUseCase: injection()));
  injection.registerFactory(() => ProductBloc(getAllProductUseCase: injection()));

  injection.registerLazySingleton(() => GetAllStoreUseCase(injection()));
  injection.registerLazySingleton(() => GetAllCartsUseCase(injection()));
  injection.registerLazySingleton(() => GetAllProductUseCase(injection()));

  injection.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: injection()));
  injection.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(cartRemoteDataSource: injection()));
  injection.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(productRemoteDataSource: injection()));

  injection.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(client: http.Client()));
  injection.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl(client: http.Client()));
  injection.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(client: http.Client()));

  injection.registerLazySingleton(() => http.Client());

}