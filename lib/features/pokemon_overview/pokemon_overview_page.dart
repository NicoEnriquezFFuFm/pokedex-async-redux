import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';

class PokemonOverviewPage extends StatelessWidget {
  PokemonOverviewPage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorRed,
            title: const Text(
              pokemonAppBarTitle,
              style: TextStyle(
                fontSize: fontSizeAppBar,
              ),
            ),
          ),
          body: Text("Hello World"),
        ),
      ),
    );
  }
}
