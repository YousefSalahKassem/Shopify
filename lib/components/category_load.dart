import 'package:flutter/material.dart';

class CategoryListSkeleton extends StatelessWidget {
  const CategoryListSkeleton({super.key});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Text(
              '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 5,
              ),
            ),
          ),
        );
      },
    );
  }
}