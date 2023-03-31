import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class SearchBarOverview extends StatelessWidget {
  const SearchBarOverview({
    required this.searchFuncPokemon,
    required this.deleteInput,
    required this.inputController,
    Key? key,
  }) : super(key: key);

  final Function(String) searchFuncPokemon;
  final VoidCallback deleteInput;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCircularSearchBar),
        ),
        hintText: hintTextSearchBar,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: deleteInput,
          icon: const Icon(Icons.clear),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
      ),
      autofocus: false,
      onChanged: searchFuncPokemon,
    );
  }
}
