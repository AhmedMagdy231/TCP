import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/components.dart';


class LoadingSimmerWidget extends StatelessWidget {
  const LoadingSimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Expanded(
      child: ListView.builder(
      
          itemCount: 20,
          itemBuilder: (context,index){
            return SizedBox(
              height: height * 0.1,
              width: width,
              child: Card(
                child:  BuildShimmer(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                         height: height,
                          width:  height*0.06,

                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Text(
                        'loading...',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),



              ),
            );
          },
      
      ),
    );
  }
}
