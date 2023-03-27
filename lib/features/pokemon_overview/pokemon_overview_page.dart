import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';
import 'package:pokedexbootcamp/widgets/overview_widget.dart';

class PokemonOverviewPage extends StatelessWidget {
  PokemonOverviewPage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;

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
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return PokemonOverview(pokemonName: pokemon);
              }),
        ),
      ),
    );
  }
}
