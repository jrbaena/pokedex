import 'package:pokedex/home/domain/pokemon.dart';
import 'package:pokedex/home/repositories/pokemon_repository.dart';

class GetPokemonList {
  final PokemonRepository _pokemonRepository;

  GetPokemonList(this._pokemonRepository);

  Future<List<Pokemon>> execute() {
    return _pokemonRepository.fetch('');
  }
}