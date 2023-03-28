import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';
import 'package:pokedexbootcamp/widgets/image_widget_pokemon_details.dart';
import 'package:pokedexbootcamp/widgets/row_description.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({
    Key? key,
    required this.pokemonDetail,
    required this.pokemonName,
  }) : super(key: key);

  final Async<PokemonDetail?> pokemonDetail;
  final String pokemonName;

  @override
  State<StatefulWidget> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          pokemonAppBarTitle,
          style: TextStyle(
            fontSize: fontSizeAppBar,
          ),
        ),
        centerTitle: true,
      ),
      body: widget.pokemonDetail.when(
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage));
          return const Center(
            child: Text(pokemonOfflineMessageLabel),
          );
        },
        (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  widget.pokemonName,
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
                  PokemonDetailsImages(pokeImage: data!.sprite!.frontDefault!),
                  PokemonDetailsImages(pokeImage: data.sprite!.backDefault!),
                  PokemonDetailsImages(pokeImage: data.sprite!.frontShiny!),
                  PokemonDetailsImages(pokeImage: data.sprite!.backShiny!),
                ],
              ),
              const Divider(),
              RowDescription(title: movePokemonDetailLabel, description: data.moves!.first.move!.name.toString()),
              RowDescription(
                  title: abilityPokemonDetailLabel, description: data.abilities!.first.ability.name.toString()),
              RowDescription(title: heightPokemonDetailLabel, description: data.height.toString()),
              RowDescription(title: baseExperiencePokemonDetailLabel, description: data.baseExperience.toString()),
              RowDescription(title: weightPokemonDetailLabel, description: data.weight.toString()),
              RowDescription(title: typepokemonDetailLabel, description: data.types!.first.type!.name.toString()),
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
}
