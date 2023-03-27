import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/api/api_service.dart';
import 'package:pokedexbootcamp/state/actions/actions.dart';
import 'package:pokedexbootcamp/state/app_state.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

//Getting of pokemons from pokemon api
class GetPokemonsAction extends LoadingAction {
  static const key = "get-pokemons-action";

  GetPokemonsAction({required super.actionKey});

  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: offSet, limit: limit);

    return state.copyWith(pokemons: pokemons);
  }
}

//Getting of pokemon details from pokemon api
class GetPokemonDetailAction extends ReduxAction<AppState> {
  GetPokemonDetailAction({required this.pokemonName});

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetail = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokeDetail: pokemonDetail);
  }
}
