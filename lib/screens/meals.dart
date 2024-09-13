import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.editFavoriteStatus});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) editFavoriteStatus;

  void _navigateMealDetails(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          editFavoriteStatus: editFavoriteStatus,
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    if (meals.isEmpty) {
      return Center(
        child: Text(
          'No meals!',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          navigateMealDetails: () {
            _navigateMealDetails(context, meals[index]);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: _content(context),
          )
        : _content(context);
  }
}
