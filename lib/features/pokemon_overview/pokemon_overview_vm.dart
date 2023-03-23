import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: _pokemons);

  List<Pokemon> get _pokemons => state.pokemons;
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
  }) : super(equals: [
          pokemons
        ]);

  final List<Pokemon> pokemons;
}
