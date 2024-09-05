import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
 late AnimationController animationController;
 late Animation<Offset> slidingAnimation;
 late Animation<Offset> slidingLoadingAnimation;
 @override
  void initState() {
    initSlidingAnimation();
    super.initState();
    navigateToHome();
  }

 

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Center(
          child: Image.asset(
            AssetsData.logo,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation,text: 'find a book you love',),
        const Spacer(
          flex: 2,
        ),
        SlidingText(slidingAnimation: slidingLoadingAnimation,text: "Read online books for free",),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
  void navigateToHome() {
   Future.delayed(
     const Duration(milliseconds: 2100),
     () {
      //  Get.to(()=>const HomeView(),transition: Transition.upToDown,duration: kTranstionDuration);
      GoRouter.of(context).pushReplacement(AppRouter.konBoardingView);
     },
   );
 }

  void initSlidingAnimation() {
    animationController = AnimationController(
     vsync: this,
     duration: const Duration(milliseconds: 1700),
   );
   slidingAnimation = Tween<Offset>(
     begin:const Offset(-1.7, 0) ,
     end: Offset.zero,
   ).animate(animationController);
   
    slidingLoadingAnimation=Tween<Offset>(
     begin:const Offset(0,10),
     end: Offset.zero ,
   ).animate(animationController);
   animationController.forward();
 }
}

