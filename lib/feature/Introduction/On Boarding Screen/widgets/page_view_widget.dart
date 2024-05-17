import 'package:flutter/material.dart';
import 'package:tricare_patient_application/feature/Introduction/On%20Boarding%20Screen/widgets/down_container.dart';
import 'package:tricare_patient_application/feature/Introduction/On%20Boarding%20Screen/widgets/top_image.dart';

import '../../../../core/component/ElevatedButton Widget/build_elevated_button.dart';

class BuildPageViewWidget extends StatelessWidget {
  final PageController boardController;

  const BuildPageViewWidget({super.key, required this.boardController});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            BuildTopWidget(image: data[index].image),
            BuildDownContainer(
              title: data[index].title,
              description: data[index].description,
            )
          ],
        );
      },
      controller: boardController,
    );
  }


}

class OnBoardingData {
  final String image;
  final String title;
  final String description;

  OnBoardingData(
      {required this.image, required this.title, required this.description});
}

List<OnBoardingData> data = [
  OnBoardingData(
      image: 'assets/images/board1.jpg',
      title: 'Welcome To TriCare',
      description: 'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips'
  ),
  OnBoardingData(
      image: 'assets/images/board2.jpg',
      title: 'Your Health Your Way',
      description: 'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips'
  ),

  OnBoardingData(
      image: 'assets/images/board3.jpg',
      title: 'Connect With TriCare',
      description: 'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips'
  ),
];
