import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/domain/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/pokemon_item.dart';
import 'package:pokedex/home/repositories/pokemon_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._pokemonRepository) : super(InitialHomeState());

  final PokemonRepository _pokemonRepository;

  init() async {
    final pokemonList = await _pokemonRepository.fetch();
    emit(LoadedHomeState(pokemonList));
  }
}
