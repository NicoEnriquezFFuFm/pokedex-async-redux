import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class ShowSnackBarErrorMessage extends StatefulWidget {
  const ShowSnackBarErrorMessage({Key? key}) : super(key: key);

  @override
  State<ShowSnackBarErrorMessage> createState() => _ShowSnackBarErrorMessageState();
}

class _ShowSnackBarErrorMessageState extends State<ShowSnackBarErrorMessage> {
  _showSnackBar() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(errorMessage),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    _showSnackBar();

    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text(pokemonOfflineMessageLabel)),
      ),
    );
  }
}
