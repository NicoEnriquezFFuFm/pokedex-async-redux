import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';
import 'package:pokedexbootcamp/widgets/bottom_navigation_bar.dart';
import 'package:pokedexbootcamp/widgets/overview_widget.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlue,
        title: const Text(
          pokemonAppBarTitle,
          style: TextStyle(
            fontSize: fontSizeAppBar,
          ),
        ),
      ),
      body: pokemons.when(
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage));
          return const Center(
            child: Text(pokemonOfflineMessageLabel),
          );
        },
        (data) => GridView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCountValue),
          itemBuilder: (_, index) {
            final pokemon = data[index];
            return PokemonOverview(pokemonName: pokemon);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage ?? emptyString)),
    );
  }
}
