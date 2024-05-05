import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';
import 'package:pokedex/home/home.dart';
import 'package:pokedex/home/repositories/pokemon_repository.dart';
import 'package:pokedex/home/repositories/pokemon_respository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
          create: (context) => PokemonRepositoryImpl(), child: BlocProvider(create: (context) =>
              HomeCubit(RepositoryProvider.of<PokemonRepository>(context)),
          child: const Home())),
    );
  }
}
