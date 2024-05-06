import '../domain/pokemon_detail_item.dart';
import '../domain/pokemon_type.dart';

abstract class PokemonRepository {
  Future<List<PokemonDetailItem>> fetch({String? nextUrl});
  Future<List<PokemonTypeItem>> fetchTypes();
  Future<List<PokemonDetailItem>> fetchPokemonListByType(String url);
}
