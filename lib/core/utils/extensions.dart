import 'enums.dart';

extension PokemonTypes on String {
  PokemonType? toPokemonType() {
    switch (this) {
      case ("electric"):
        return PokemonType.electric;

      case ("fire"):
        return PokemonType.fire;

      case ("ice"):
        return PokemonType.ice;

      case ("grass"):
        return PokemonType.grass;

      case ("water"):
        return PokemonType.water;

      case ("poison"):
        return PokemonType.poison;

      case ("flying"):
        return PokemonType.flying;

      case ("ghost"):
        return PokemonType.ghost;

      case ("dark"):
        return PokemonType.dark;
      case ("dragon"):
        return PokemonType.dragon;
      case ("bug"):
        return PokemonType.bug;
      case ("ground"):
        return PokemonType.ground;
      case ("fairy"):
        return PokemonType.fairy;
      case ("fighting"):
        return PokemonType.fighting;
      case ("normal"):
        return PokemonType.normal;
      case ("psychic"):
        return PokemonType.psychic;
      case ("rock"):
        return PokemonType.rock;
      case ("steel"):
        return PokemonType.steel;
    }
    return null;
  }
}
