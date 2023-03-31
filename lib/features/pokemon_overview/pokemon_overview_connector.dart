import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/features/pokemon_overview/pokemon_overview_page.dart';
import 'package:pokedexbootcamp/features/pokemon_overview/pokemon_overview_vm.dart';
import 'package:pokedexbootcamp/state/actions/pokemon_actions.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

class PokemonOverviewConnector extends StatelessWidget {
  const PokemonOverviewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonOverviewVm>(
      vm: () => PokemonOverviewVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonsAction(actionKey: '')),
      builder: (context, vm) => PokemonOverviewPage(
        pokemons: vm.pokemons,
        search: vm.onSearch,
        delete: vm.onDelete,
        pokemonSearch: vm.pokemonSearch,
      ),
    );
  }
}
