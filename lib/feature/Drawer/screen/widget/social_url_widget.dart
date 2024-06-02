import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/components.dart';



class SocialUrlWidget extends StatelessWidget {
  const SocialUrlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        var cubit = context.read<DrawerCubit>();
        return cubit.settingUrlModel == null ? BuildShimmer(
          child: Column(

            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    width: width*0.08,
                    height: width*0.08,
                    color: Colors.grey,

                  ),
                  Container(
                    width: width*0.08,
                    height: width*0.08,
                    color: Colors.grey,

                  ),
                  Container(
                    width: width*0.08,
                    height: width*0.08,
                    color: Colors.grey,

                  ),
                  Container(
                    width: width*0.08,
                    height: width*0.08,
                    color: Colors.grey,

                  ),
                  Container(
                    width: width*0.08,
                    height: width*0.08,
                    color: Colors.grey,

                  ),

                ],
              ),
            ],
          ),
        ) :

        Wrap(
          children: [


            if(cubit.settingUrlModel!.data!.websiteSocialInstagramUrl!.isNotEmpty)
              BuildIconUrl(
                function: () async {
                  String url = cubit.settingUrlModel!.data!
                      .websiteSocialInstagramUrl!;
                  final Uri _url = Uri.parse(url);
                  launchUrl(_url,
                      mode: LaunchMode.externalApplication);
                },
                icon: FontAwesomeIcons.instagram,
                color: Colors.purple,
              ),


            if(cubit.settingUrlModel!.data!.websiteSocialYoutubeUrl!.isNotEmpty)
              BuildIconUrl(
                function: () async {
                  String url = cubit.settingUrlModel!.data!
                      .websiteSocialYoutubeUrl!;
                  final Uri _url = await Uri.parse(
                    url,
                  );

                  launchUrl(_url,
                      mode: LaunchMode.externalApplication);
                },
                icon: FontAwesomeIcons.youtubeSquare,
                color: Colors.red,
              ),


            if(cubit.settingUrlModel!.data!.websiteSocialFacebookUrl!.isNotEmpty)
              BuildIconUrl(
                function: () async {
                  String url = cubit.settingUrlModel!.data!
                      .websiteSocialFacebookUrl!;
                  final Uri _url = Uri.parse(url);
                  launchUrl(_url,
                      mode: LaunchMode.externalApplication);
                },
                icon: FontAwesomeIcons.facebookSquare,
                color: Colors.blue,
              ),


            if(cubit.settingUrlModel!.data!.websiteContactWhatsapp!.isNotEmpty)
              BuildIconUrl(
                //whatsapp://send?phone=+
                function: () async {
                  String url =
                      'whatsapp://send?phone=+${cubit.settingUrlModel!.data!.websiteContactWhatsapp}';
                  final Uri _url = Uri.parse(url);
                  launchUrl(_url,
                      mode: LaunchMode.externalApplication);
                },
                icon: FontAwesomeIcons.whatsappSquare,
                color: Colors.green,
              ),


            if(cubit.settingUrlModel!.data!.websiteContactPhone!.isNotEmpty)
              BuildIconUrl(
                function: () async {
                  String url =
                      'tel:+${cubit.settingUrlModel!.data!.websiteContactPhone}';
                  final Uri _url = Uri.parse(url);
                  launchUrl(_url,
                      mode: LaunchMode.externalApplication);
                },
                icon: FontAwesomeIcons.phoneSquare,
                color: Colors.amber,
              ),


            if(cubit.settingUrlModel!.data!.websiteContactWebsite!.isNotEmpty)
              BuildIconUrl(
                function: () async {
                  String url = cubit.settingUrlModel!.data!.websiteContactWebsite!;
                  final Uri _url = Uri.parse(url);
                  launchUrl(_url, mode: LaunchMode.externalApplication);
                },
                icon: FontAwesomeIcons.globe,
                color: Colors.grey,
              ),


          ],
        );
      },
    );
  }

}




class BuildIconUrl extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function() function;

  BuildIconUrl({required this.icon,required this.color,required this.function});



  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Icon(icon,color: color,),
    );

  }
}
