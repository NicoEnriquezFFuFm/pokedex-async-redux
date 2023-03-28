import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';
import 'package:pokedexbootcamp/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedexbootcamp/state/actions/pokemon_actions.dart';
import 'package:pokedexbootcamp/state/app_state.dart';
import 'package:pokedexbootcamp/utils/async.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm? fromStore() => PokemonDetailsVm(pokemonDetail: _pokemonDetail());

  Async<PokemonDetail?> _pokemonDetail() {
    if (state.wait.isWaitingFor(GetPokemonDetailAction.key)) return const Async.loading();
    if (state.pokeDetail == null) return const Async.error(errorMessage);

    return Async(state.pokeDetail);
  }
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({
    required this.pokemonDetail,
  }) : super(equals: [pokemonDetail]);

  final Async<PokemonDetail?> pokemonDetail;
}
