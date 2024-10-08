import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

//Teil von CategoriesScreen
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, required this.navigateMealsScreen, super.key});

  final Category category;
  final void Function() navigateMealsScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateMealsScreen,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16), //nur wenn gedrückt
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
