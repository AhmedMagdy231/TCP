import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/utils/utils.dart';
import 'package:tricare_patient_application/feature/Authentication/cubit/auth_cubit.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'HomeLayout/cubit/app_cubit.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int activeStep =0;
  @override
  Widget build(BuildContext context) {

    return  BlocListener<AppCubit,AppState>(
        listener: (context,state){
         },

      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
// import 'package:tricare_patient_application/core/constant/constant.dart';
// import 'package:tricare_patient_application/core/functions/fucntions.dart';
// import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
// import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
// import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
// import 'package:tricare_patient_application/core/widgets/Build%20Circle%20Image/build_circle_image.dart';
// import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';
// import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
// import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
// import 'package:tricare_patient_application/feature/Book/screen/widget/book_card_widget.dart';
// import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';
// import 'package:tricare_patient_application/feature/Sessions/model/session_model.dart';
//
// class BookScreen extends StatelessWidget {
//
//   final bool comeFromHomeLayout;
//
//   const BookScreen({super.key,  this.comeFromHomeLayout = true});
//
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery
//         .of(context)
//         .size
//         .height;
//     var width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     return Scaffold(
//
//       appBar: !comeFromHomeLayout? AppBar(
//         title: Text('Booking'),
//       ):null,
//
//       body: CashHelper.getData(key: 'login')== null?
//       BuildEmptyDataWidget(text: 'You do not have any book appointment',)
//           :BlocBuilder<SessionCubit, SessionState>(
//         builder: (context, state) {
//           switch (state.sessionStatus) {
//             case Status.loading:
//               return BuildLoadingWidget();
//             case Status.success:
//               return SessionsWidget(sessionModel: context.read<SessionCubit>().sessionModel!);
//             case Status.failure:
//               return BuildErrorWidget(error: state.callback);
//             case Status.noInternet:
//               return NoInternetWidget(onPressed: () {},);
//             default:
//               return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
//
//
// class SessionsWidget extends StatelessWidget {
//   final SessionModel sessionModel;
//
//   const SessionsWidget({super.key, required this.sessionModel});
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView.builder(
//         itemCount: sessionModel.data!.sessions!.length,
//         itemBuilder: (context, index) {
//           return BookCardWidget(
//             index: index,
//             doctorId: sessionModel.data!.sessions![index].pARTNERID!,
//             status: sessionModel.data!.sessions![index].status!,
//             day: getDayName(sessionModel.data!.sessions![index].sessionDate!,locale: CashHelper.getData(key: 'local')??'en'),
//             date: sessionModel.data!.sessions![index].sessionDate!,
//             time: convertTo12HourFormat(sessionModel.data!.sessions![index].sessionStart!),
//             name: sessionModel.data!.sessions![index].partnerName!,
//             image: sessionModel.data!.sessions![index].partnerPic!,
//             position: sessionModel.data!.sessions![index].partnerPosition!,
//             doctorRate: sessionModel.data!.sessions![index].partnerReviewsAvg!,
//
//           );
//         },
//       ),
//     );
//   }
// }
//

