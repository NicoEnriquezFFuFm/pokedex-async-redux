import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/api/api_service.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

const _offSet = '0';
const _limit = '151';

//Getting of pokemons from pokemon api
class GetPokemonAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final pokemon = await ApiService().pokemonApi.getPokemonList(offset: _offSet, limit: _limit);

    return state.copyWith(pokemons: pokemon);
  }
}
