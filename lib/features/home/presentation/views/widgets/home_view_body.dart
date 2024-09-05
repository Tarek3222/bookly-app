import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/see_all_books.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Recommended for you",
                    style: Styles.textStyle18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Based on your reading history",
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const FeaturedBooskListView(),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      const Text(
                        "Newest Books",
                        style: Styles.textStyle18,
                      ),
                      const Spacer(),
                      SeeAllBestNewestItems(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kSeeAllBooksView);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: NewestBooksListView(
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
