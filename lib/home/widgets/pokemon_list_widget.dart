import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/detail/pokemon_detail_page.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state is ErrorHomeState) {}
        if (state is LoadingHomeState) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is LoadedHomeState) {
          final pokemonList = state.pokemonList;
          bool isRequested = state.isRequested;
          bool isFilteringByType = state.isFilteringByType;

          return NotificationListener(
            onNotification: (ScrollNotification scrollNotification) {
              if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent &&
                  !isRequested &&
                  !isFilteringByType) {
                homeCubit.next();
                isRequested = true;
                return true;
              }
              return false;
            },
            child: Stack(
              children: [
                Visibility(
                  visible: isRequested,
                  child: Positioned(
                    bottom: 20,
                    left: (MediaQuery.of(context).size.width / 2) - 17.5,
                    child: Center(
                        child: SizedBox(
                            height: 35,
                            width: 35,
                            child: CircularProgressIndicator(
                              color: Colors.blueGrey.withOpacity(0.5),
                            ))),
                  ),
                ),
                ListView.builder(
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailPage(pokemon: pokemon)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: pokemon.frontProfileImage,
                              width: 60,
                              height: 60,
                              placeholder: (context, url) => const SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Center(
                                      child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    pokemon.name,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
