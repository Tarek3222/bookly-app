import 'package:bookly/features/book_marks/presentation/views/widgets/book_marks_view_body.dart';
import 'package:bookly/features/categories/presentation/views/widgets/categories_view_body.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> pages = const [
    HomeViewBody(),
    CategoriesViewBody(),
    BookMarksViewBody(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            bottom: 22,
            right: 40,
            left: 40,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    icon:  Icon(
                      Icons.home,
                      color:currentIndex == 0 ? Colors.green : Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    icon:  Icon(
                      Icons.category_outlined,
                      color:currentIndex == 1 ? Colors.green : Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    icon:  Icon(
                      Icons.bookmarks,
                      color:currentIndex == 2 ? Colors.green : Colors.white,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
