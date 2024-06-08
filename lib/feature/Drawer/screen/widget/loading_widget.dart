import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/widgets/Carousel%20Widget/build_list_title.dart';

import '../../../../core/component/components.dart';

class BuildLoadingShimmerWidget extends StatelessWidget {
  const BuildLoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildShimmer(
      child: ListView(
        children: [
          SizedBox(
              height: height*0.3,
              width: width,

              child: Padding(
                padding: EdgeInsets.all(width*0.08),
                child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),
              )),

          Column(
            children: [
              BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),
              BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),
              BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),
              BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),
              BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),
              BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),BuildListTitle(
                text: 'Loading...',
                iconName: 'loading.svg',
                function: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
