import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.init();

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state is ErrorHomeState) {}
        if (state is LoadingHomeState) {}
        if (state is LoadedHomeState) {
          final pokemonList = state.pokemonList;
          return ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: Text(
                      pokemon.name,
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List item $index"));
              });
        }
        return Container();
      },
    );
  }

}