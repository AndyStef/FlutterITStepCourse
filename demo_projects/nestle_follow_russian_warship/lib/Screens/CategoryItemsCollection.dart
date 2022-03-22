import 'package:flutter/material.dart';
import 'package:nestle_follow_russian_warship/Model/Category.dart';

class CategoryItemsCollection extends StatelessWidget {
  final Category category;

  const CategoryItemsCollection({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = category.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: category.products.isEmpty
          ? const Center(
              child: Text('Ця категорія не має продуктів'),
            )
          : GridView.count(
              childAspectRatio: 0.92,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(4.0),
              children: category.products.map((product) {
                var imageName = product.imageName;
                return Card(
                  elevation: 6.0,
                  child: Column(
                    children: [
                      const SizedBox(height: 8.0),
                      Text(product.name),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'images/$imageName',
                          height: 165,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
