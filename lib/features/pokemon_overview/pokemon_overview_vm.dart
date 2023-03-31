import 'dart:ui';

import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedexbootcamp/state/actions/pokemon_actions.dart';
import 'package:pokedexbootcamp/state/app_state.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(
        pokemons: _pokemons(),
        onSearch: (query) => dispatchSync(SearchPokemonsAction(query: query)),
        onDelete: () => dispatchSync(ClearSearchedPokemonsAction()),
        pokemonSearch: state.searchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.onSearch,
    required this.onDelete,
    required this.pokemons,
    required this.pokemonSearch,
  }) : super(equals: [pokemons, pokemonSearch]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> pokemonSearch;
  final Function(String) onSearch;
  final VoidCallback onDelete;
}
