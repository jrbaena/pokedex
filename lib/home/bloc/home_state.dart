part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final List<PokemonDetailItem> pokemonList;

  LoadedHomeState(this.pokemonList);
}

class ErrorHomeState extends HomeState {}
