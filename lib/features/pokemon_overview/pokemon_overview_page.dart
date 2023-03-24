import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
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
          body: pokemons == null
              ? const CircularProgressIndicator()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          //TODO: onTap will navigate to the details of the pokemon
                          onTap: null,
                          child: ListTile(
                            title: Text(
                              pokemons[index].name,
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
                  }),
        ),
      ),
    );
  }
}
