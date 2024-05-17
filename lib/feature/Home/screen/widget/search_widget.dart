import 'package:flutter/material.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.02),
      width: double.infinity,
      height: height*0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Row(
        children: [
          Icon(Icons.search,color: Colors.grey,),
          SizedBox(width: 8,),
          Text(
              'Search at doctor or clinic ...',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
              ),
          ),
        ],
      ),
    );
  }
}
