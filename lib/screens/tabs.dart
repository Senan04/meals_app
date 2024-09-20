import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPage = 0;
  var _selectedPageTitle = 'Categories';
  final List<Meal> favoriteMeals = [];

  void _infoMessage(String message, Meal? meal) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      action: meal != null
          ? SnackBarAction(
              label: 'Undo',
              onPressed: () => setState(() {
                favoriteMeals.add(meal);
              }),
            )
          : null,
    ));
  }

  void _editFavoriteStatus(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      _infoMessage('Meal removed from favorites', meal);
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      _infoMessage('Meal added to favorites', null);
    }
  }

  void _selectPage(final index) {
    setState(() {
      _selectedPage = index;
      _selectedPageTitle = index == 0 ? 'Categories' : 'Favorites';
    });
  }

  void _setScreen(final String id) {
    setState(() {
      switch (id) {
        case 'filter':
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
          );
          break;
        default:
          Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = CategoriesScreen(
      editFavoriteStatus: _editFavoriteStatus,
    );

    if (_selectedPage == 1) {
      activeWidget = MealsScreen(
        meals: favoriteMeals,
        editFavoriteStatus: _editFavoriteStatus,
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
