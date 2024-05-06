part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {
  final String? type;

  LoadingHomeState({this.type});
}

class LoadedHomeState extends HomeState {
  //Objeto pokemon con lo necesario pa mostrar, incluyendo url de siguiente
  //copy with para ir copiando el estado loaded añadiendo más pokemons (paginación)
  final List<PokemonDetailItem> pokemonList;
  final List<PokemonTypeItem>? pokemonTypeList;
  final String? nextUrl;
  final bool isRequested;

  LoadedHomeState({required this.pokemonList, this.pokemonTypeList, this.nextUrl, required this.isRequested});

  LoadedHomeState copyWith({
    List<PokemonDetailItem>? pokemonList,
    List<PokemonTypeItem>? pokemonTypeList,
    String? nextUrl,
    required bool isRequested,
  }) {
    return LoadedHomeState(
      pokemonList: pokemonList ?? this.pokemonList,
      pokemonTypeList: pokemonTypeList ?? this.pokemonTypeList,
      nextUrl: nextUrl ?? this.nextUrl,
      isRequested: isRequested,
    );
  }

  LoadedHomeState copyWithRequest({
    required bool isRequested,
  }) {
    return LoadedHomeState(
      pokemonList: pokemonList,
      pokemonTypeList: pokemonTypeList,
      nextUrl: nextUrl,
      isRequested: isRequested,
    );
  }
}

class ErrorHomeState extends HomeState {}
