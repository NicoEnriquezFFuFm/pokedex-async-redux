import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';

class PokemonDetailsImages extends StatelessWidget {
  const PokemonDetailsImages({
    Key? key,
    this.pokeImage,
  }) : super(key: key);

  final dynamic pokeImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: spriteWeightSize,
      height: spriteHeightSize,
      margin: const EdgeInsets.all(marginInsetsImage),
      padding: const EdgeInsets.all(paddingInsetsImage),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(borderRadiusCircular),
        border: Border.all(
          color: colorWhite,
          width: borderWidthImage,
        ),
      ),
      child: Image.network(pokeImage, fit: BoxFit.fitHeight),
    );
  }
}
