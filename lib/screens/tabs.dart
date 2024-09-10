import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPage = 0;
  var _selectedPageTitle = 'Categories';

  _selectPage(final index) {
    setState(() {
      _selectedPage = index;
      _selectedPageTitle = index == 0 ? 'Categories' : 'Favorites';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = const CategoriesScreen();

    if (_selectedPage == 1) {
      activeWidget = const MealsScreen(meals: []);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageTitle),
      ),
      body: activeWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
