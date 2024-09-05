import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/utils/functions/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookButtonAction extends StatelessWidget {
  const BookButtonAction({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
                onPressed: () {
                  if (book.saleInfo?.saleability != "NOT_FOR_SALE" &&
                      book.saleInfo?.price != null) {
                    launchCustomUrl(context: context,url: book.saleInfo!.buyLink!,text: "Book not found in store");
                  }
                },
                text: book.saleInfo?.saleability == "NOT_FOR_SALE"
                    ? "Free"
                    : "${book.saleInfo?.price ?? 100.40}\$",
                backgroundColor: Colors.white,
                textStyle: Styles.textStyle18
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
          ),
          Expanded(
            child: CustomButton(
                onPressed: () {
                  if (book.volumeInfo?.previewLink != null) {
                    launchCustomUrl(context: context,url: book.volumeInfo!.previewLink!, text: "can't open preview");
                  }else{
                    showSnackBar(context: context,text: "can't open preview",color: Colors.red);
                  }
                },
                text:book.volumeInfo?.previewLink != null ? "Preview" : "No Preview",
                backgroundColor: const Color(0xffEf8262),
                textStyle: Styles.textStyle14
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          ),
        ],
      ),
    );
  }

}
