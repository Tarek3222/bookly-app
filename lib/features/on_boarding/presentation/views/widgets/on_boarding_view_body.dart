import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/on_boarding/data/models/on_board_model.dart';
import 'package:bookly/features/on_boarding/presentation/views/widgets/dot_indicator.dart';
import 'package:bookly/features/on_boarding/presentation/views/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            allowImplicitScrolling: true,
            controller: pageController,
            itemCount: OnBoardModel.onBoardList.length,
            itemBuilder: (context, index) {
              return OnBoardingContent(
                image: OnBoardModel.onBoardList[index].image,
                title: OnBoardModel.onBoardList[index].title,
                subTitle: OnBoardModel.onBoardList[index].subTitle,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                },
                textStyle: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold,fontSize: 16),
                text: "skip",
                borderRadius: BorderRadius.circular(30),),
            const SizedBox(
              width: 50,
            ),
            ...List.generate(
              OnBoardModel.onBoardList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: DotIndicator(
                  isActive: currentPage == index,
                ),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: kTranstionDuration,
                    curve: Curves.fastEaseInToSlowEaseOut,          
                  );
                  if(currentPage==2){
                      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                    }
                },
                style: IconButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(
                  FontAwesomeIcons.arrowRight,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    ));
  }
}
