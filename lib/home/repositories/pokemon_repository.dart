import '../domain/pokemon_detail_item.dart';

abstract class PokemonRepository {
  Future<List<PokemonDetailItem>> fetch();
}
