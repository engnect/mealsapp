import 'package:flutter/material.dart';
import 'package:mealsapp/data/category_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/favorites.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_card.dart';

// Global State - Global State Management
class Categories extends StatelessWidget {
  const Categories({super.key});

  void _changeScreen(Category c, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Meals(
        category: c,
      );
    }));
  }

  // * => context objesi stateless widgetlarda yalnızca build fonksiyonu içerisinde erişim açıktır
  // => Stateful widgetlarda ise, build fonksiyonu dışındanda erişilebilir. (Widget'ın içinde olma şartıyla)
  @override
  Widget build(BuildContext context) {
    const List<Category> categoryList = categories;
    // Kategoriler model olarak data dosyasından gelmeli.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoriler"),
        actions: [
          // Favoriler sayfasına geçiş yapsın.
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const Favorites())));
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      // Inkwell, GestureDetector
      body: GridView(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 3),
          children: categoryList
              .map((e) => CategoryCard(
                    category: e,
                    onCategoryClick: () {
                      // Ekranı yeni sayfaya navigate et...
                      //Navigator.of(context)
                      //Theme.of(context)
                      //Localizations.of(context)
                      _changeScreen(e, context);
                    },
                  ))
              .toList()),
    );
  }
}
