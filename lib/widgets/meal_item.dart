import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_short_infos.dart';
import 'package:transparent_image/transparent_image.dart';

//Teil von MealsScreen
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.navigateMealDetails,
  });

  final Meal meal;

  final void Function() navigateMealDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: () => navigateMealDetails(),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover, //damit das Bild reinzoomt und alles ausfüllt
                height: 200,
                width: double
                    .infinity, //so breit wie möglich, damit keine Ränder entstehen
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        MealShortInfos(
                          icon: Icons.alarm,
                          label: '${meal.duration.toString()} min',
                        ),
                        const Spacer(),
                        MealShortInfos(
                          icon: Icons.lock_outlined,
                          label: meal.complexity.name.replaceFirst(
                            meal.complexity.name[0],
                            meal.complexity.name[0].toUpperCase(),
                          ),
                        ),
                        const Spacer(),
                        MealShortInfos(
                          icon: Icons.euro,
                          label: meal.affordability.name.replaceFirst(
                            meal.affordability.name[0],
                            meal.affordability.name[0].toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
