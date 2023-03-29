import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedexbootcamp/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedexbootcamp/state/actions/pokemon_actions.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({
    Key? key,
    required this.pokemonName,
  }) : super(key: key);

  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailAction(pokemonName: pokemonName)),
      onDispose: (store) => store.dispatchAsync(DisposePokemonDetailAction()),
      builder: (context, vm) => PokemonDetailsPage(
        pokemonDetail: vm.pokemonDetail,
        pokemonName: pokemonName,
      ),
    );
  }
}
