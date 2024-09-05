import 'package:bookly/core/widgets/custom_skeleton_book_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonBooksListView extends StatelessWidget {
  const CustomSkeletonBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Skeletonizer(
      child: ListView.builder(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>const  Padding(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 8,
              ),
              child:  CustomSkeletonBookItem(),
            ),
            itemCount: 10,
          ),
    );
  }
}