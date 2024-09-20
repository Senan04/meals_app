import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenSwitch = false;
  var _lactoseSwitch = false;
  var _vegetarianSwitch = false;
  var _veganSwitch = false;

  void _setScreen(final String id) {
    setState(() {
      switch (id) {
        case 'meals':
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const TabsScreen()),
          );
          break;
        default:
          Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: MainDrawer(setScreen: _setScreen),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenSwitch,
            onChanged: (newStatus) => setState(() {
              _glutenSwitch = newStatus;
            }),
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only show gluten-free Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            secondary: const Icon(FontAwesomeIcons.wheatAwn),
          ),
          SwitchListTile(
            value: _lactoseSwitch,
            onChanged: (newStatus) => setState(() {
              _lactoseSwitch = newStatus;
            }),
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only show lactose-free Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            secondary: const Icon(FontAwesomeIcons.glassWater),
          ),
          SwitchListTile(
            value: _vegetarianSwitch,
            onChanged: (newStatus) => setState(() {
              _vegetarianSwitch = newStatus;
            }),
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only show vegetarian Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            secondary: const Icon(FontAwesomeIcons.leaf),
          ),
          SwitchListTile(
            value: _veganSwitch,
            onChanged: (newStatus) => setState(() {
              _veganSwitch = newStatus;
            }),
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only show vegan Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            secondary: const Icon(FontAwesomeIcons.seedling),
          ),
        ],
      ),
    );
  }
}
