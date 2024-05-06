import 'package:pokedex/home/domain/pokemon_detail_item.dart';

class PokemonListItem {
  final String nextUrl;
  final List<PokemonDetailItem> pokemonDetailList;

  PokemonListItem({required this.nextUrl, required this.pokemonDetailList});
}
