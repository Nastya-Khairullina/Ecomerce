import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/bestseller_entity.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/entities/homestore_entity.dart';
import '../../domain/use_case/get_all_homestore.dart';
import '../../domain/use_case/get_all_store.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllStoreUseCase getAllStoreUseCase;

  HomeBloc({required this.getAllStoreUseCase}) : super(HomeLoadingState()) {
    on<HomeLoadEvent>((event, emit) async{
      emit(HomeLoadingState());
      List<HomeStoreEntity> _loadedHomeStoreList = [];
      List<BestSellerEntity> _loadedBestSellerList = [];
      final _loadedStoreList = await getAllStoreUseCase(getAllHomestoreParams(query: event.homeQuery));
      List<StoreEntity> _storeList = [];

      _loadedStoreList.fold((l) => emit(const HomeErrorState(message: 'error')),
              (r) => _storeList.addAll(r));

      _loadedHomeStoreList = _storeList.map<List<HomeStoreEntity>>((e) => e.homeStore!).expand((element) => element).toList();
      _loadedBestSellerList = _storeList.map<List<BestSellerEntity>>((e) => e.bestSeller!).expand((element) => element).toList();

      emit(HomeLoadedState(loadedHomestore: _loadedHomeStoreList, loadedBestseller: _loadedBestSellerList, loadedStore: _storeList));
    });
  }
}