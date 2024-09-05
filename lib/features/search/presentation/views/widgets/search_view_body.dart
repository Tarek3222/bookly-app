import 'package:bookly/features/search/presentation/views/widgets/custom_text_field_search.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child:  Column(children: [
            SizedBox(
              height: 30,
            ),
            CustomTextFieldSearch(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: SearchResultListView()),
          ]),
        );
  }
}

