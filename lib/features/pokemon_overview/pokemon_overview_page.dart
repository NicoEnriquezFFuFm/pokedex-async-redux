import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    //TODO: will delete this
    pokemons;
    return const Placeholder();
  }
}
