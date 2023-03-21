import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/api/api_service.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

import 'features/home_page.dart';

Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );
  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );

  final pokemons = await ApiService().pokemonApi.getPokemonDetails(id: '1');
  pokemons;
}
