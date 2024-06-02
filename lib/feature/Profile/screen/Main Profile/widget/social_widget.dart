import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/Carousel Widget/build_list_title.dart';

class SocialProfileWidget extends StatelessWidget {
  const SocialProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<DrawerCubit>();
    return Column(
      children: [

        if(cubit.settingUrlModel!.data!.websiteContactPhone!.isNotEmpty)
        BuildListTitle(
          text: 'Phone',
          iconName: 'phone.svg',
          function: () {
            String url =
                'tel:+${cubit.settingUrlModel!.data!.websiteContactPhone}';
            final Uri _url = Uri.parse(url);
            launchUrl(_url,
                mode: LaunchMode.externalApplication);
          },
        ),

        if(cubit.settingUrlModel!.data!.websiteSocialFacebookUrl!.isNotEmpty)
        BuildListTitle(
          text: 'Facebook',
          iconName: 'facebook.svg',
          function: () {
            String url = cubit.settingUrlModel!.data!
                .websiteSocialFacebookUrl!;
            final Uri _url = Uri.parse(url);
            launchUrl(_url,
                mode: LaunchMode.externalApplication);
          },
        ),

        if(cubit.settingUrlModel!.data!.websiteContactWhatsapp!.isNotEmpty)
        BuildListTitle(
          text: 'WhatsApp',
          iconName: 'whatsApp.svg',
          function: () {
            String url =
                'whatsapp://send?phone=+${cubit.settingUrlModel!.data!.websiteContactWhatsapp}';
            final Uri _url = Uri.parse(url);
            launchUrl(_url, mode: LaunchMode.externalApplication);
          },
        ),

        if(cubit.settingUrlModel!.data!.websiteSocialInstagramUrl!.isNotEmpty)
        BuildListTitle(
          text: 'Instagram',
          iconName: 'instagram.svg',
          function: () {
            String url = cubit.settingUrlModel!.data!
                .websiteSocialInstagramUrl!;
            final Uri _url = Uri.parse(url);
            launchUrl(_url,
                mode: LaunchMode.externalApplication);
          },
        ),

        if(cubit.settingUrlModel!.data!.websiteSocialYoutubeUrl!.isNotEmpty)
        BuildListTitle(
          text: 'Youtube',
          iconName: 'youtube.svg',
          function: () async {
            String url = cubit.settingUrlModel!.data!
                .websiteSocialYoutubeUrl!;
            final Uri _url =  Uri.parse(
              url,
            );

            launchUrl(_url,
                mode: LaunchMode.externalApplication);
          },
        ),

        if(cubit.settingUrlModel!.data!.websiteContactWebsite!.isNotEmpty)
        BuildListTitle(
          text: 'Website',
          iconName: 'website.svg',
          function: () {
            String url = cubit.settingUrlModel!.data!.websiteContactWebsite!;
            final Uri _url = Uri.parse(url);
            launchUrl(_url, mode: LaunchMode.externalApplication);
          },
        ),
      ],
    );
  }
}
