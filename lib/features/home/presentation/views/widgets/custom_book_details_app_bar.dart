import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/functions/show_snack_bar.dart';
import 'package:bookly/core/widgets/custom_icon_button.dart';
import 'package:bookly/features/book_marks/presentation/view_model/fav_books/fav_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CutomBookDetailsAppBar extends StatefulWidget {
  const CutomBookDetailsAppBar({super.key, required this.book});
  final BookModel book;

  @override
  State<CutomBookDetailsAppBar> createState() => _CutomBookDetailsAppBarState();
}

class _CutomBookDetailsAppBarState extends State<CutomBookDetailsAppBar> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icons.close,
        ),
        CustomIconButton(
          onPressed: () {
            BlocProvider.of<FavBooksCubit>(context).addBook(widget.book);
            showSnackBar(
                context: context,
                text: "Book added to favorites",
                color: Colors.greenAccent);
            setState(() {
              isFav = !isFav;
            });
          },
          icon: isFav ? Icons.bookmark_added : Icons.bookmark_add_outlined,
        ),
      ],
    );
  }
}
