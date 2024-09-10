import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Instructions',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          for (int i = 0; i < meal.steps.length; i++)
            Text(
              '${i + 1}. ${meal.steps[i]}',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
