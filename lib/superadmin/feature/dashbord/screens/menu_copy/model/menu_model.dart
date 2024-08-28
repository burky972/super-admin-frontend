import 'package:flutter/material.dart';

class MenuModel {
  final String name;
  List<MenuCategory> categories;

  MenuModel({
    required this.name,
    required this.categories,
  });

  MenuModel copyWith({
    List<MenuCategory>? categories,
  }) {
    return MenuModel(
      name: this.name,
      categories: categories ?? this.categories,
    );
  }
}

class MenuCategory {
  final String name;
  final List<MenuItem> items;

  MenuCategory({
    required this.name,
    required this.items,
  });
}

class MenuItem {
  final String name;
  final double price;
  final String description;

  MenuItem({
    required this.name,
    required this.price,
    required this.description,
  });
}
