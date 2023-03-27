import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class PokemonOverview extends StatelessWidget {
  const PokemonOverview({
    Key? key,
    required this.pokemonName,
  }) : super(key: key);

  final Pokemon pokemonName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          //TODO: onTap will navigate to the details of the pokemon
          onTap: null,
          child: ListTile(
            title: Text(
              pokemonName.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSizePokedexOverview,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
