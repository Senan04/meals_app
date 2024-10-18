import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  //TODO add undo button
  void _infoMessage(Meal? meal, BuildContext ctx) {
    final mealAdded = meal == null;
    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(
        mealAdded
            ? 'Meal was added to favorites'
            : 'Meal was removed from favorites',
      ),
      // action: mealAdded
      //     ? null
      //     : SnackBarAction(
      //         label: 'Undo',
      //         onPressed: () => ref
      //             .read(favoriteMealsProvider.notifier)
      //             .toggleFavoriteStatus(meal),
      //       ),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final mealAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteStatus(meal);
              if (mealAdded) {
                _infoMessage(null, context);
              } else {
                _infoMessage(meal, context);
              }
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(
              height: 5,
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  ingredient,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
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
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < meal.steps.length; i++)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Text(
                      '${i + 1}. ${meal.steps[i]}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                      textAlign: TextAlign.start,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
