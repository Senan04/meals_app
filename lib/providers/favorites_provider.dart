import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); //initialisiert StateNotifier mit []

  void editFavoriteStatus(Meal meal) {
    if (state.contains(meal)) {
      var stateCopy = List.of(state);
      stateCopy.remove(meal);
      state = stateCopy;
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
