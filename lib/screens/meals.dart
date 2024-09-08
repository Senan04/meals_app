import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  ListView _content() {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Text(
        meals[index].title,
        style:
            Theme.of(ctx).textTheme.titleLarge!.copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty
          ? Center(
              child: Text(
                'No meals!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            )
          : _content(),
    );
  }
}
