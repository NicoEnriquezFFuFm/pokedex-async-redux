import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/features/home_page.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

void main() {
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
}
