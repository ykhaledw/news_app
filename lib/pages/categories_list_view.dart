import 'package:flutter/material.dart';
import 'package:new_app/models/category_model.dart';
import 'package:new_app/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(name: 'Business', image: 'assets/business1.jpg'),
    CategoryModel(name: 'Entertainment', image: 'assets/entertainment1.jpg'),
    CategoryModel(name: 'General', image: 'assets/general1.jpg'),
    CategoryModel(name: 'Health', image: 'assets/health1.jpg'),
    CategoryModel(name: 'Science', image: 'assets/science1.jpg'),
    CategoryModel(name: 'Sports', image: 'assets/sports1.jpg'),
    CategoryModel(name: 'Technology', image: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17, top: 10),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) => CategoryItem(
            category: categories[i],
          ),
        ),
      ),
    );
  }
}
