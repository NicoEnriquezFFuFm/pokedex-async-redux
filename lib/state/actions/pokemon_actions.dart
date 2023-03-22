import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/api/api_service.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

const String _offSet = '0';
const String _limit = '151';

//Getting of pokemons from pokemon api
class GetPokemonAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: _offSet, limit: _limit);

    return state.copyWith(pokemons: pokemons);
  }
}
