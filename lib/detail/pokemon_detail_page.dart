import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/home/domain/pokemon_detail_item.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final PokemonDetailItem pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.75),
        surfaceTintColor: Colors.white,
        elevation: 7.5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CachedNetworkImage(
                      imageUrl: pokemon.frontProfileImage,
                      width: 60,
                      height: 60,
                      placeholder: (context, url) => const SizedBox(
                          height: 15,
                          width: 15,
                          child: Center(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    CachedNetworkImage(
                      imageUrl: pokemon.backProfileImage,
                      width: 60,
                      height: 60,
                      placeholder: (context, url) => const SizedBox(
                          height: 15,
                          width: 15,
                          child: Center(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(pokemon.type.name),
                SizedBox(
                  height: 10,
                ),
                Text(pokemon.name),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.balance),
                          Text('Peso: ${pokemon.weight} kg'),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Icon(Icons.height),
                          Text('Altura: ${pokemon.height} m'),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
