import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Search/cubit/search_cubit.dart';
import 'package:tricare_patient_application/feature/Search/screen/doctor_search_screen.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        context.read<SearchCubit>().getDoctorSearch(query: '',id: '0');
        navigateTo(context, DoctorSearchScreen());
      },
      child: Container(
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
      ),
    );
  }
}
