import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/domain/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/pokemon_type.dart';
import 'package:pokedex/home/repositories/pokemon_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._pokemonRepository) : super(InitialHomeState());

  final PokemonRepository _pokemonRepository;

  void init() async {
    emit(LoadingHomeState());
    final pokemonListItem = await _pokemonRepository.fetch();
    final pokemonTypeList = await _pokemonRepository.fetchTypes();
    emit(LoadedHomeState(
      pokemonList: pokemonListItem.pokemonDetailList,
      pokemonTypeList: pokemonTypeList,
      nextUrl: pokemonListItem.nextUrl,
      isRequested: false,
    ));
  }

  void reload() {
    init();
  }

  getPokemonListFromType(PokemonTypeItem pokemonTypeSelected) async {
    final pokemonTypeList = (state as LoadedHomeState).pokemonTypeList;
    emit(LoadingHomeState(type: pokemonTypeSelected.name));
    final pokemonList = await _pokemonRepository
        .fetchPokemonListByType(pokemonTypeSelected.url);
    emit(LoadedHomeState(
      pokemonList: pokemonList,
      pokemonTypeList: pokemonTypeList,
      isRequested: false,
      isFilteringByType: true,
    ));
  }

  void next() async {
    if (state is! LoadedHomeState) {
      return;
    }
    emit((state as LoadedHomeState).copyWith(isRequested: true));
    List<PokemonDetailItem> currentPokemonList =
        (state as LoadedHomeState).pokemonList;
    final nextUrl = (state as LoadedHomeState).nextUrl;
    final pokemonListItem =
        await _pokemonRepository.fetch(nextUrlToLoad: nextUrl);
    currentPokemonList.addAll(pokemonListItem.pokemonDetailList);
    emit((state as LoadedHomeState).copyWith(
        pokemonList: currentPokemonList,
        nextUrl: pokemonListItem.nextUrl,
        isRequested: false));
  }
}
