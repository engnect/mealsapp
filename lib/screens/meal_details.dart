import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({required this.meal, super.key});
  final Meal meal;

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          // Favoriler sayfasına geçiş yapsın.
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavorite(widget.meal);
              },
              icon: Icon(favorites.contains(widget.meal)
                  ? Icons.favorite
                  : Icons.favorite_border))
        ],
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromARGB(255, 38, 30, 23),
          ),
          Text(
            "Puanı ${widget.meal.rating.toString()}",
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: "Montserrat"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: Image.network(widget.meal.imageUrl),
          ),
          const Text(
            "Malzemeler",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                fontFamily: "Montserrat"),
          ),
          const Divider(
            color: Color.fromARGB(255, 38, 30, 23),
            indent: 25,
            endIndent: 25,
          ),
          Text(
            widget.meal.ingredients.toList().join('\n'),
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "Montserrat"),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
