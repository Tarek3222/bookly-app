import 'package:flutter/material.dart';

class CategoryModel{
  final IconData icon;
  final String name;
  final Color iconColor;

 const CategoryModel({required this.icon, required this.name, required this.iconColor});

 static List<CategoryModel> categories = const[
    CategoryModel(icon: Icons.computer, name: "Computers", iconColor: Colors.blue),
    CategoryModel(icon: Icons.health_and_safety, name: "Health", iconColor: Colors.red),
    CategoryModel(icon: Icons.attach_money, name: "finance", iconColor: Colors.green),
    CategoryModel(icon: Icons.analytics, name: "Mathematics", iconColor: Colors.purple),
    CategoryModel(icon: Icons.cast_for_education, name: "Education", iconColor: Colors.white),
    CategoryModel(icon: Icons.biotech, name: "Biography", iconColor: Colors.brown),
    CategoryModel(icon: Icons.business_center, name: "Business", iconColor: Colors.pink),
    CategoryModel(icon: Icons.image_aspect_ratio_outlined, name: "Fiction", iconColor: Colors.orange),
    CategoryModel(icon: Icons.policy, name: "Criminals", iconColor: Colors.indigo),
    CategoryModel(icon: Icons.fitness_center, name: "Fitness", iconColor: Colors.yellow),
    CategoryModel(icon: Icons.history, name: "History", iconColor: Colors.black),
    CategoryModel(icon: Icons.sports_baseball, name: "Sports", iconColor: Colors.purpleAccent),
  ];
}