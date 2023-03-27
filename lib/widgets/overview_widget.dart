import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class PokemonOverview extends StatelessWidget {
  const PokemonOverview({Key? key, required this.pokemonName}) : super(key: key);

  final Pokemon pokemonName;

  @override
  Widget build(BuildContext context) {
    var extractNumbers = pokemonName.url.replaceAll(new RegExp(r'[^0-9]'), '');
    var extractPokemonId = extractNumbers.substring(1);

    return Column(
      children: [
        GestureDetector(
          //TODO: onTap will navigate to the details of the pokemon
          onTap: null,
          child: Container(
            width: widthConstant,
            height: heightConstant,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(imageURL + extractPokemonId + pngExtension),
                fit: BoxFit.cover,
              ),
            ),
            child: Card(
              color: Colors.transparent,
              child: Container(
                alignment: AlignmentDirectional.topCenter,
                child: Text(
                  pokemonName.name,
                  style: const TextStyle(fontSize: fontSize),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
