import 'package:flutter/material.dart';
import 'package:new_app/models/category_model.dart';
import 'package:new_app/pages/category_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryView(category: category.name,)));
        print('Category Tapped');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          height: 150,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.black,
            backgroundBlendMode: BlendMode.colorBurn,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                opacity: 0.5,
                image: AssetImage(category.image),
                fit: BoxFit.fill),
          ),
          child: Center(
              child: Text(
            category.name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
