import 'package:flutter/material.dart';

//Teil von MealItem
class MealShortInfos extends StatelessWidget {
  const MealShortInfos({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize = 17,
  });

  final IconData icon;
  final double iconSize;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: const Color.fromARGB(216, 255, 255, 255),
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: const Color.fromARGB(216, 255, 255, 255)),
        ),
      ],
    );
  }
}
