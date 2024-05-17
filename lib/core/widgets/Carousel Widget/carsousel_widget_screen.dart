import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../component/Network Image/network_image.dart';

class CarouselSliderWidget extends StatefulWidget {
  final double width;
  final double height;
  //final CarouselController carouselController;
  final List<String> images;



  const CarouselSliderWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.images,


  }) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {

  int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height * 0.2,
          child: CarouselSlider.builder(
          //  carouselController: widget.carouselController,
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BuildImage(
                  image: widget.images[index],
                  radius: 10,
                  placeHolder: Image.asset('assets/images/logo.png',),
                  fit: BoxFit.cover,

                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              aspectRatio: 16 / 9,
              viewportFraction: 0.80,
              initialPage: currentIndex,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
          ),
        ),
        SizedBox(height: widget.height*0.02,),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.images.length,
            effect: const ExpandingDotsEffect(
              spacing: 5.0,
              radius: 2.0,
              dotWidth: 10.0,
              dotHeight: 5.0,
              paintStyle: PaintingStyle.fill,
              strokeWidth: 12,
              dotColor: Colors.grey,
              activeDotColor: AppColor.primaryColor,
            ),
          ),
        ),
        SizedBox(height: widget.height*0.01,),
      ],
    );
  }
}