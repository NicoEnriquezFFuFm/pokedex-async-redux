import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class PokemonOverview extends StatelessWidget {
  const PokemonOverview({
    Key? key,
    required this.pokemonName,
  }) : super(key: key);

  final Pokemon pokemonName;

  @override
  Widget build(BuildContext context) {
    var extractNumbers = pokemonName.url.replaceAll(RegExp(r'[^0-9]'), '');
    var extractPokemonId = extractNumbers.substring(1);

    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailsConnector(
                pokemonName: pokemonName.name,
              ),
            ),
          ),
          child: Container(
            width: widthConstant,
            height: heightConstant,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
              image: DecorationImage(
                image: NetworkImage(imageURL + extractPokemonId + pngExtension),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Text(
                  pokemonName.name,
                  style: const TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
