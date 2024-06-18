import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Search/cubit/search_cubit.dart';
import 'package:tricare_patient_application/feature/Search/screen/search%20by%20name/doctor_search_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../Book/cubit/book_cubit.dart';
import '../../../HomeLayout/cubit/app_cubit.dart';
import '../../../Search/screen/search by all/search_by_all.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        context.read<BookCubit>().getBranches(doctorId: '0');
        navigateTo(context, SearchByAllScreen(specialties: context.read<AppCubit>().homeModel!.data!.specialties!,));
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
                S.of(context).searchAtDoctorOrClinic,
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
