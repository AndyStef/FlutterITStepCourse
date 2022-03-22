import 'package:flutter/material.dart';
import 'package:nestle_follow_russian_warship/Model/CategoriesGenerator.dart';
import 'package:nestle_follow_russian_warship/Model/Category.dart';
import 'CategoryItemsCollection.dart';

class CategoriesListScreen extends StatelessWidget {
  var categories = CategoriesGenerator().generateAllCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nestle іди нах*й')),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            var category = categories[index];
            return CategoryListCell(
              category: category,
              tapCallback: () {
                navigateToProductsScreen(context, category);
              },
            );
          }),
    );
  }

  void navigateToProductsScreen(BuildContext context, Category category) {
    // Push new screen into navigation stack
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryItemsCollection(
          category: category,
        ),
      ),
    );
  }
}

class CategoryListCell extends StatelessWidget {
  const CategoryListCell({
    Key? key,
    required this.category,
    required this.tapCallback,
  }) : super(key: key);

  final Category category;
  final GestureTapCallback? tapCallback;

  @override
  Widget build(BuildContext context) {
    var categoryName = category.name;
    var categoryImage = category.imageName;
    return GestureDetector(
      onTap: tapCallback,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 10.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                categoryName,
                style: const TextStyle(fontSize: 36.0),
              ),
            ),
            Image.asset('images/$categoryImage'),
          ],
        ),
      ),
    );
  }
}
