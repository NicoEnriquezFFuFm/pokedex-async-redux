import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/state/actions/pokemon_actions.dart';
import 'package:pokedexbootcamp/state/app_state.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch<AppState>(context, GetPokemonsDetailAction());

    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              homePage,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
