import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/Login%20First/login_first_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Notification/cubit/notification_cubit.dart';
import 'package:tricare_patient_application/feature/Notification/screens/widget/build_notification_widget.dart';
import 'package:tricare_patient_application/feature/Notification/screens/widget/loading.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notification),
      ),

      body: CashHelper.getData(key: 'login') == null?

      BuildLoginFirst(
          heightImage: width*0.8,
          widthImage:  width*0.8,
          height: height,
          width: width
      )
      :BlocBuilder<NotificationCubit,NotificationState>(
        builder: (context,state){
          switch(state.getNotification){
            case Status.initial || Status.loading:
              return LoadingShimmerNotification();
            case Status.success:
              var cubit = context.read<NotificationCubit>();
              return cubit.notificationModel!.hasError== true?
             BuildEmptyDataWidget(text: S.of(context).youDoNotHaveAnyNotificationYet,):
              ListView.builder(
                itemCount: cubit.notificationModel!.data!.notification.length,
                itemBuilder: (context, index) {
                  return
                  BuildNotificationWidget(
                    index: index,
                    image: context.read<ProfileCubit>().userImage,

                    date: cubit.notificationModel!.data!
                        .notification![index].patinotificationDate!,

                    time: cubit.notificationModel!.data!
                        .notification![index].patinotificationTime!,

                    message: cubit.notificationModel!.data!
                        .notification![index].patinotificationMessage!,

                    actionId: cubit.notificationModel!.data!
                        .notification![index].patinotificationActionId!,

                    action: cubit.notificationModel!.data!
                        .notification![index].patinotificationAction!,

                    id: cubit.notificationModel!.data!
                        .notification![index].patinotificationid!,

                    iconString: cubit.notificationModel!.data!
                        .notification![index].patinotificationIcon!,

                    read: cubit.notificationModel!.data!
                        .notification![index].patinotificationRead!,

                  );
                },
              );
            case Status.failure:
              return BuildErrorWidget(error: S.of(context).error);
            case Status.noInternet:
              return NoInternetWidget(onPressed: (){
               context.read<NotificationCubit>().getNotification();
          });

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
