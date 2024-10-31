part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLoadEvent extends HomeEvent{
  final String homeQuery;
  const HomeLoadEvent(this.homeQuery);

  @override
  List<Object> get props => throw UnimplementedError();

}

