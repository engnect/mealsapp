import 'package:mealsapp/models/meal.dart';

const meals = [
  Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Çorbası",
      imageUrl:
          "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/mercimek-corbasi-yemekcom.jpg",
      ingredients: ["Mercimek", "Tuz"],
      rating: 4.5),
  Meal(
      id: "2",
      categoryId: "1",
      name: "Ezogelin Çorbası",
      imageUrl:
          "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/ezogelin-corbasi-yemekcom.jpg",
      ingredients: ["Salça", "Tuz"],
      rating: 4),
  Meal(
      id: "3",
      categoryId: "2",
      name: "Menemen",
      imageUrl:
          "https://cdn.yemek.com/mnresize/1250/833/uploads/2023/10/soganli-menemen-yemekcom.jpg",
      ingredients: ["Yumurta", "Domates", "Biber", "Tuz"],
      rating: 4),
  Meal(
      id: "4",
      categoryId: "4",
      name: "Arpa Şehriye Salatası",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2020/08/12/arpa-sehriye-salatasi-orijinal-5.jpg",
      ingredients: [
        "Arpa Şehriye",
        "Sıvı Yağ",
        "Tuz",
        "Dereotu",
        "Soğan",
        "Maydanoz",
        "Havuç",
        "Kırmızı Biber",
        "Mısır",
        "Salatalık Turşusu",
        "Limon Suyu"
      ],
      rating: 4),
  Meal(
      id: "5",
      categoryId: "3",
      name: "Lahmacun",
      imageUrl:
          "https://cdn.yemek.com/mnresize/940/940/uploads/2020/04/lahmacun-yeni-one-cikan.jpg",
      ingredients: ["Kıyma", "Tuz", "Biber", "Hamur", "Baharat", "Soğan"],
      rating: 4.6),
];
