import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/homestore_entity.dart';
import '../../domain/use_case/get_all_homestore.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllHomestoreUseCase getAllHomestoreUseCase;

  HomeBloc({required this.getAllHomestoreUseCase}) : super(HomeLoadingState()) {
    on<HomeLoadEvent>((event, emit) async{
      emit(HomeLoadingState());
      final _loadedStoreList = await getAllHomestoreUseCase(getAllHomestoreParams(query: event.homeQuery));
      List<HomeStoreEntity> _loadedHomeStoreList = [];

      _loadedStoreList.fold(
              (failure){
                emit(HomeErrorState(message: failure.toString()));
                },
              (loadedStoreList)
      {
        _loadedHomeStoreList.addAll(loadedStoreList);
              });


      emit(HomeLoadedState(loadedHomestore: _loadedHomeStoreList));
    });
  }
}

