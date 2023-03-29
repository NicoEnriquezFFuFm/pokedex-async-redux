import 'package:flutter/material.dart';
import 'package:pokedexbootcamp/utils/constants.dart';

class RowDescription extends StatelessWidget {
  const RowDescription({
    required this.titleLabel,
    required this.description,
    super.key,
  });

  final String titleLabel;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              titleLabel,
              style: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
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
