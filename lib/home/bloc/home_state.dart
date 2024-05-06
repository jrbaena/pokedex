part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  //Objeto pokemon con lo necesario pa mostrar, incluyendo url de siguiente
  //copy with para ir copiando el estado loaded añadiendo más pokemons (paginación)
  final List<PokemonDetailItem> pokemonList;
  final List<PokemonTypeItem>? pokemonTypeList;

  LoadedHomeState({required this.pokemonList, this.pokemonTypeList});

  LoadedHomeState copyWith({
    List<PokemonDetailItem>? pokemonList,
    List<PokemonTypeItem>? pokemonTypeList,
  }) {
    return LoadedHomeState(
      pokemonList: pokemonList ?? this.pokemonList,
      pokemonTypeList: pokemonTypeList ?? this.pokemonTypeList,
    );
  }
}

class ErrorHomeState extends HomeState {}
