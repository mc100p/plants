import 'package:flutter/material.dart';
import 'package:plants/pages/categoriesList.dart';

Container circularContainer(Color color, Widget child) {
  return Container(
    padding: const EdgeInsets.all(19),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: color,
    ),
    child: child,
  );
}

Color backgroundColor() {
  return const Color(0xFFE8EDDE);
}

Widget categoriesWidget(BuildContext context, CategoryWidget index,
    int selectedIndex, int currentIndex) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 20),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 18.0),
      decoration: BoxDecoration(
          color: selectedIndex == currentIndex
              ? Theme.of(context).primaryColor
              : const Color(0xFFDDE2D1),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          index.name,
          style: TextStyle(
              color: selectedIndex == currentIndex
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              fontSize: 18.0),
        ),
      ),
    ),
  );
}

Widget icons(BuildContext context, IconData icon, Color decorationColor,
    Color iconColor) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(200),
      color: decorationColor,
    ),
    child: Icon(
      icon,
      size: 40.0,
      color: iconColor,
    ),
  );
}
