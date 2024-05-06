import '../models/pokemon_detail_item.dart';
import '../models/pokemon_list_item.dart';
import '../models/pokemon_type.dart';

abstract class PokemonRepository {
  Future<PokemonListItem> fetch({String? nextUrlToLoad});
  Future<PokemonDetailItem> fetchPokemonDetail(String url);
  Future<List<PokemonTypeItem>> fetchTypes();
  Future<List<PokemonDetailItem>> fetchPokemonListByType(String url);
}
