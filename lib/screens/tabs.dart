import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedPage = 0;
  var _selectedPageTitle = 'Categories';

  void _selectPage(final index) {
    setState(() {
      _selectedPage = index;
      _selectedPageTitle = index == 0 ? 'Categories' : 'Favorites';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = CategoriesScreen(
      currentMeals: ref.watch(filteredMealsProvider),
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
      drawer: MainDrawer(),
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
