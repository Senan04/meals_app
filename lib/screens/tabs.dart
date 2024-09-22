import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

final kInitialFilters = {for (var filter in Filters.values) filter: false};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key, required this.filterSwitches});

  final Map<Filters, bool>? filterSwitches;

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedPage = 0;
  var _selectedPageTitle = 'Categories';
  late Map<Filters, bool> currentFilters;

  @override
  void initState() {
    super.initState();
    currentFilters = widget.filterSwitches ?? kInitialFilters;
  }

  void _selectPage(final index) {
    setState(() {
      _selectedPage = index;
      _selectedPageTitle = index == 0 ? 'Categories' : 'Favorites';
    });
  }

  void _setScreen(final String id) {
    switch (id) {
      case 'filter':
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => FiltersScreen(filterSwitches: currentFilters),
          ),
        );
        break;
      default:
        Navigator.of(context).pop();
    }
  }

  List<Meal> _filterCurrentMeals(Map<Filters, bool> filterSwitches) {
    return dummyMeals.where((meal) {
      if (filterSwitches[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filterSwitches[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filterSwitches[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (filterSwitches[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = CategoriesScreen(
      currentMeals: _filterCurrentMeals(currentFilters),
    );

    if (_selectedPage == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeWidget = MealsScreen(
        meals: favoriteMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageTitle),
      ),
      drawer: MainDrawer(setScreen: _setScreen),
      body: activeWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
