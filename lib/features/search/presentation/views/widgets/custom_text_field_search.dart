import 'package:bookly/features/search/presentation/views%20model/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (data){
        BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks(searchText: data);
      },
      decoration: InputDecoration(
        hintText: "Search",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
          ),
        ),
      ),
    );
  }
}
