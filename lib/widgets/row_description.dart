import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class RowDescription extends StatelessWidget {
  const RowDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$title:",
              style: const TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: widthSizedBoxDivider),
            Text(
              description,
              style: const TextStyle(fontSize: fontSize),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
