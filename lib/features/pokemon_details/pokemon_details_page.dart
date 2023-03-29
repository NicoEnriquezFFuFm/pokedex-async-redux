import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';
import 'package:pokedexbootcamp/widgets/image_widget_pokemon_details.dart';
import 'package:pokedexbootcamp/widgets/row_description.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetail,
    required this.pokemonName,
    Key? key,
  }) : super(key: key);

  final Async<PokemonDetail?> pokemonDetail;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _navigateBackToHome(context),
        ),
        title: const Text(
          pokemonAppBarTitle,
          style: TextStyle(fontSize: fontSizeAppBar),
        ),
        centerTitle: true,
      ),
      body: pokemonDetail.when(
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage));
          return const Center(child: Text(pokemonOfflineMessageLabel));
        },
        (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  pokemonName,
                  style: const TextStyle(
                    fontSize: fontSizePokemonDetailName,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PokemonDetailsImages(pokeImage: data!.sprite.frontDefault),
                  PokemonDetailsImages(pokeImage: data!.sprite.backDefault),
                  PokemonDetailsImages(pokeImage: data!.sprite.frontShiny),
                  PokemonDetailsImages(pokeImage: data!.sprite.backShiny),
                ],
              ),
              const Divider(),
              RowDescription(titleLabel: movePokemonDetailLabel, description: data!.moves.first.move!.name.toString()),
              RowDescription(
                  titleLabel: abilityPokemonDetailLabel, description: data.abilities.first.ability.name.toString()),
              RowDescription(titleLabel: heightPokemonDetailLabel, description: data.height.toString()),
              RowDescription(titleLabel: baseExperiencePokemonDetailLabel, description: data.baseExperience.toString()),
              RowDescription(titleLabel: weightPokemonDetailLabel, description: data.weight.toString()),
              RowDescription(titleLabel: typepokemonDetailLabel, description: data.types.first.type.name.toString()),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage ?? emptyString)),
    );
  }

  void _navigateBackToHome(BuildContext context) {
    Navigator.of(context).pop();
  }
}
