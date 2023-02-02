import 'package:cine_flutter/modules/movies/domain/enums/category.dart';
import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final Category category;
  const CategoryTag({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        category.description,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }
}
