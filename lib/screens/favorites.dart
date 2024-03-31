import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';
import 'package:mealsapp/screens/meal_details.dart';

class Favorites extends ConsumerStatefulWidget {
  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends ConsumerState<Favorites> {
  @override
  Widget build(BuildContext context) {
    List<Meal> favorites = ref.watch(favoriteMealsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favoriler'),
        ),
        // Tasarım verilecek.
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: favorites.length,
            //shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                onTap: () {
                  if (favorites.isNotEmpty) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return MealDetails(meal: favorites[index]);
                    }));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(221, 255, 182, 142),
                      border: Border.all(
                          color: const Color.fromARGB(115, 46, 22, 8)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.network(
                              favorites[index].imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          favorites[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                          softWrap: false,
                          //textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
