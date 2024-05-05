import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    homeCubit.init();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Pokédex'),
        shadowColor: Colors.black.withOpacity(0.75),
        elevation: 12.5,
        leadingWidth: 51.0,
        toolbarHeight: 65,
        leading: Container(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset('assets/images/icons/pokeball.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => _getPokeDialog());
            },
            icon: const Icon(Icons.filter_hdr),
            padding: const EdgeInsets.only(right: 16.0),
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
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
            return ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  color: Colors.blue,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getPokeDialog() {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('HOLA SOY UN POKEMON'),
            SizedBox(
              height: 25,
            ),
            Text('Otro texto')
          ],
        ),
      ),
    );
  }
}
