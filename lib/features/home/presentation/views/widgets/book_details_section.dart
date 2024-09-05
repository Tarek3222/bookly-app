import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/utils/functions/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_icon_button.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_button_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_book.dart';
import 'package:bookly/features/home/presentation/views/widgets/some_details_about_book.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.223,
          child: CustomBookCard(
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.greenAccent.withOpacity(0.7),
          ),
          child: Text(
            book.volumeInfo?.categories?[0] ?? "unknown",
            style: Styles.textStyle14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SomeDetailsAboutBook(
                title: "pages",
                subTitle: book.volumeInfo?.pageCount?.toString() ?? "0"),
            const SizedBox(
              width: 20,
            ),
            SomeDetailsAboutBook(
                title: "Published",
                subTitle: book.volumeInfo?.publishedDate ?? "2024-10-01"),
            const SizedBox(
              width: 20,
            ),
            CustomIconButton(
              onPressed: () {
                if (book.accessInfo!.pdf!.isAvailable! &&
                    book.saleInfo?.saleability == "NOT_FOR_SALE" &&
                    book.accessInfo?.pdf?.acsTokenLink != null) {
                  launchCustomUrl(
                    context: context,
                      url: book.accessInfo!.pdf!.acsTokenLink!,
                      text: "book not avilable to download");
                }else{
                  showSnackBar(context: context, text: "Book not avilable to download",color: Colors.red);
                }
              },
              icon: book.accessInfo!.pdf!.isAvailable! && book.saleInfo?.saleability == "NOT_FOR_SALE" ? Icons.download :Icons.file_download_off_sharp,
            ),
            CustomIconButton(
              onPressed: () {
                Share.share(book.volumeInfo?.infoLink ?? "book url not found",subject: book.volumeInfo?.title);
              },
              icon: Icons.share,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          book.volumeInfo?.title ?? "",
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        Text(
          book.volumeInfo?.authors?[0] ?? "",
          style: Styles.textStyle18.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RatingBook(
          rating: book.volumeInfo?.averageRating?.toDouble() ?? 0.0,
          count: book.volumeInfo?.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
        BookButtonAction(
          book: book,
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Description : ",
              style: Styles.textStyle18,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            book.volumeInfo?.description ?? "",
            style: Styles.textStyle14.copyWith(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
