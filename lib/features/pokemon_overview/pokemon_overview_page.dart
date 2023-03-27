import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';
import 'package:pokedexbootcamp/widgets/overview_widget.dart';
import 'package:pokedexbootcamp/widgets/snack_bar_error.dart';

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
            backgroundColor: colorBlue,
            title: const Text(
              pokemonAppBarTitle,
              style: TextStyle(
                fontSize: fontSizeAppBar,
              ),
            ),
          ),
          body: pokemons.when(
            (data) => GridView.builder(
              shrinkWrap: true,
              itemCount: int.parse(limit),
              itemBuilder: (context, index) {
                final pokemon = data[index];
                return PokemonOverview(pokemonName: pokemon);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCountValue),
            ),
            loading: () => const Text(loadingLabel),
            error: (errorMessage) => ShowSnackBarErrorMessage(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: colorBlue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: homeLabel,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: favoriteLabel,
              ),
            ],
            selectedItemColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
