import 'package:flutter/material.dart';

import '../../../../../core/widgets/product Item Widget/build_product_item.dart';
import '../../../model/doctor_details_model.dart';

class DoctorArticlesWidget extends StatelessWidget {
  final List<PartnersPost> articles;

  const DoctorArticlesWidget({super.key, required this.articles});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height*0.25,
      width: width,
      child: ListView.builder(

          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: articles.length,
          itemBuilder: (context,index){
            return  SizedBox(
              height: height*0.2,
              width: width*0.5,
              child: BuildProductItem(
                image: articles[index].parpostFilename!,
                name: articles[index].parpostTitle!,
                description: '',
              ),
            );
          }
      ),

    );
  }
}
