import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Notification/cubit/notification_cubit.dart';
import 'package:tricare_patient_application/feature/Notification/screens/widget/build_notification_widget.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),

      body: BlocBuilder<NotificationCubit,NotificationState>(
        builder: (context,state){
          switch(state.getNotification){
            case Status.initial || Status.loading:
              return BuildLoadingWidget();
            case Status.success:
              var cubit = context.read<NotificationCubit>();
              return ListView.builder(
                itemCount: cubit.notificationModel!.data!.notification!.length,
                itemBuilder: (context, index) {
                  return BuildNotificationWidget(
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
              return BuildErrorWidget(error: 'Error');
            case Status.noInternet:
              return NoInternetWidget(onPressed: (){
               context.read<NotificationCubit>().getNotification();
          });
          }
        },
      ),
    );
  }
}
