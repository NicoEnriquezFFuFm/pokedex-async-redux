import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';
import 'package:pokedexbootcamp/widgets/bottom_navigation_bar.dart';
import 'package:pokedexbootcamp/widgets/overview_widget.dart';
import 'package:pokedexbootcamp/widgets/search_bar_widget.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.search,
    required this.delete,
    required this.pokemonSearch,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> pokemonSearch;
  final Function(String) search;
  final VoidCallback delete;

  @override
  State<StatefulWidget> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController inputController = TextEditingController();
  late bool isSearching;
  late Timer debounce;

  @override
  void initState() {
    inputController = TextEditingController();
    isSearching = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

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
      body: widget.pokemons.when(
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage));
          return const Center(
            child: Text(pokemonOfflineMessageLabel),
          );
        },
        (data) {
          if (isSearching) data = widget.pokemonSearch;
          if (data.isEmpty) const Center(child: Text(noSearchResultFoundlabel));

          return SingleChildScrollView(
            child: Column(
              children: [
                SearchBarOverview(
                  searchFuncPokemon: _searchPokemon,
                  deleteInput: _deleteSearchInput,
                  inputController: inputController,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCountValue),
                  itemBuilder: (_, index) {
                    final pokemon = data[index];
                    return PokemonOverview(pokemonName: pokemon);
                  },
                ),
              ],
            ),
          );
        },
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

  void _searchPokemon(String text) {
    debounce = Timer(const Duration(milliseconds: 600), () {
      setState(() {
        widget.search(text);
        isSearching = true;
      });
    });
  }

  void _deleteSearchInput() {
    setState(() {
      widget.delete();
      isSearching = false;
      inputController.clear();
    });
  }
}
