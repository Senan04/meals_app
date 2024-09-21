import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.filterSwitches});

  final Map<Filters, bool>? filterSwitches;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Map<Filters, bool> currentFilters;

  @override
  void initState() {
    super.initState();
    currentFilters = widget.filterSwitches ?? kInitialFilters;
  }

  void _setScreen(final String id) {
    setState(() {
      switch (id) {
        case 'meals':
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => TabsScreen(filterSwitches: currentFilters),
          ));
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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: currentFilters[Filters.glutenFree]!,
              onChanged: (newStatus) => setState(() {
                currentFilters[Filters.glutenFree] = newStatus;
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
              value: currentFilters[Filters.lactoseFree]!,
              onChanged: (newStatus) => setState(() {
                currentFilters[Filters.lactoseFree] = newStatus;
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
              value: currentFilters[Filters.vegetarian]!,
              onChanged: (newStatus) => setState(() {
                currentFilters[Filters.vegetarian] = newStatus;
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
              value: currentFilters[Filters.vegan]!,
              onChanged: (newStatus) => setState(() {
                currentFilters[Filters.vegan] = newStatus;
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
      ),
    );
  }
}
