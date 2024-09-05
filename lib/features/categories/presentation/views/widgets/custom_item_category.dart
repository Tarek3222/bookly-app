import 'package:bookly/features/categories/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomItemCategory extends StatelessWidget {
  const CustomItemCategory(
      {super.key, required this.category,
     });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            category.icon,
            color: category.iconColor,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(category.name),
        ],
      ),
    );
  }
}
