import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_skelton.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_book.dart';
import 'package:flutter/material.dart';

class CustomSkeletonBookItem extends StatelessWidget {
  const CustomSkeletonBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        margin: const EdgeInsets.only(right: 8),
        child: Row(
          children: [
           const CustomSkelton(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "title not found",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGTSectraFine,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'author not found',
                      style: Styles.textStyle14.copyWith(
                        color: Colors.white.withOpacity(0.2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                           "free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.2)),
                              
                        ),
                        const RatingBook(
                          rating: 199,
                          count: 200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}