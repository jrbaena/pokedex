part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {
  final String? type;

  LoadingHomeState({this.type});
}

class LoadedHomeState extends HomeState {
  final List<PokemonDetailItem> pokemonList;
  final List<PokemonTypeItem>? pokemonTypeList;
  final String? nextUrl;
  final bool isRequested;
  final bool isFilteringByType;

  LoadedHomeState({
    required this.pokemonList,
    this.pokemonTypeList,
    this.nextUrl,
    required this.isRequested,
    this.isFilteringByType = false,
  });

  LoadedHomeState copyWith({
    List<PokemonDetailItem>? pokemonList,
    List<PokemonTypeItem>? pokemonTypeList,
    String? nextUrl,
    required bool isRequested,
    bool? isFilteringByType,
  }) {
    return LoadedHomeState(
      pokemonList: pokemonList ?? this.pokemonList,
      pokemonTypeList: pokemonTypeList ?? this.pokemonTypeList,
      nextUrl: nextUrl ?? this.nextUrl,
      isRequested: isRequested,
      isFilteringByType: isFilteringByType ?? this.isFilteringByType,
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
