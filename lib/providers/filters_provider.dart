import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({for (final filter in Filters.values) filter: false});

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state, //Spread Operator kopiert alles aus Map
      filter: isActive, //Überschreibt das K-V-Paar
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final currentFilters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
    if (currentFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (currentFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (currentFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (currentFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
