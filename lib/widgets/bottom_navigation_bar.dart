import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constants.dart';
import 'package:pokedexbootcamp/utils/theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: colorBlue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: homeLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: favoriteLabel,
        ),
      ],
      selectedItemColor: colorWhite,
    );
  }
}
