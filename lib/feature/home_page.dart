import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
