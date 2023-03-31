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
    required this.searchedPokemons,
    required this.onDeleteInput,
    required this.onSearchPokemon,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final Function(String) onSearchPokemon;
  final VoidCallback onDeleteInput;

  @override
  State<StatefulWidget> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController inputController = TextEditingController();
  late bool isSearching;
  late Timer _debounce;

  @override
  void initState() {
    inputController = TextEditingController();
    isSearching = false;
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    _deleteSearchInput();
    _debounce.cancel();
    super.dispose();
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
          if (isSearching) data = widget.searchedPokemons;
          if (data.isEmpty) {
            return Column(
              children: [
                SearchBarOverview(
                  onSearchPokemon: _searchPokemon,
                  onDeleteInput: _deleteSearchInput,
                  inputController: inputController,
                ),
                const SizedBox(height: heightSizedBoxDivider),
                const Center(
                  child: Text(
                    noSearchResultFoundlabel,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SearchBarOverview(
                  onSearchPokemon: _searchPokemon,
                  onDeleteInput: _deleteSearchInput,
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
    _debounce = Timer(const Duration(milliseconds: milliSecondsValue), () {
      widget.onSearchPokemon(text);
      setState(() => isSearching = true);
    });
  }

  void _deleteSearchInput() {
    widget.onDeleteInput;
    inputController.clear();
    setState(() => isSearching = false);
  }
}
