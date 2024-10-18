import 'package:flutter_riverpod/flutter_riverpod.dart';

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
