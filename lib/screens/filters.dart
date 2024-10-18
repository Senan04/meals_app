import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filters, bool> currentFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          SwitchListTile(
            value: currentFilters[Filters.glutenFree]!,
            onChanged: (newStatus) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.glutenFree, newStatus),
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
            onChanged: (newStatus) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.lactoseFree, newStatus),
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
            onChanged: (newStatus) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.vegetarian, newStatus),
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
            onChanged: (newStatus) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.vegan, newStatus),
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
