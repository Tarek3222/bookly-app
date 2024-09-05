import 'package:bookly/core/utils/assets.dart';

class OnBoardModel {
  final String image;
  final String title;
  final String subTitle;
  static List<OnBoardModel> onBoardList = [
    OnBoardModel(
        image: AssetsData.onBoardingImageOne,
        title: "Read Your Favorite Books",
        subTitle:
            "We have put all the best books so that you can find and enjoy all the books."),
    OnBoardModel(
        image: AssetsData.onBoardingImageTwo,
        title: "Read online books for free",
        subTitle:
            "Online books is the best way to learn. it will help you to build your reading habit"),
    OnBoardModel(
        image: AssetsData.onBoardingImageThree,
        title: "Books for Everyone",
        subTitle:
            "Anyone can read books to improve their knowledge."),
  ];
  OnBoardModel(
      {required this.image, required this.title, required this.subTitle});
}
