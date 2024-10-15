part of 'home_cubit.dart';

enum HomeTab { card, flyer, gifts, profile }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.card,
  });
  final HomeTab tab;
  @override
  List<Object> get props => [tab];
}

final class HomeInitial extends HomeState {}
