import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); //initialisiert StateNotifier mit []

  ///Adds meal to favorites or removes it if it is already included in the list.
  ///
  ///Returns `true` if it was added and `false` if it was removed.
  bool toggleFavoriteStatus(Meal meal) {
    if (state.contains(meal)) {
      var stateCopy = List.of(state);
      stateCopy.remove(meal);
      state = stateCopy;
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
