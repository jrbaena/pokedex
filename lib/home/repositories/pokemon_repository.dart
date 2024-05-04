import '../domain/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetch(String url);
}
