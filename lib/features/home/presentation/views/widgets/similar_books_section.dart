import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "you can also like",
              style: Styles.textStyle14
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
