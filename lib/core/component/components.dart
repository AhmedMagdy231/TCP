import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';


import '../Global Cubit/global_cubit.dart';
import '../globle/color/dark_app_color.dart';

Center buildOverlayLoading(double height,{required BuildContext context}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SpinKitCubeGrid(
          color: AppColor.primaryColor,
          size: 50.0,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
        context.read<GlobalCubit>().local == 'en'? 'Loading Please Wait': 'جاري تحميل من فضلك انتظر',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

LoaderOverlay buildGlobOverLay({required Widget widget}) {
  return LoaderOverlay(
    useDefaultLoading: false,
    overlayWidget: const Center(
      child: SpinKitCubeGrid(
        color: AppColor.primaryColor,
        size: 50.0,
      ),
    ),
    overlayColor: Colors.black87,
    overlayOpacity: 0.8,
    child: widget,
  );
}

class BuildShimmer extends StatelessWidget {
  final Widget child;

  BuildShimmer({
    super.key,
    required this.child,

  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child,
baseColor: !context.read<GlobalCubit>().isLight? DarkAppColor.foreGroundColors: Colors.grey.shade50,
highlightColor: !context.read<GlobalCubit>().isLight?Colors.white12 : Color(0xffadd8e6),
    );
  }
}


//baseColor: !context.read<GlobalCubit>().isLight? DarkAppColor.foreGroundColors: Colors.grey.shade50,
//highlightColor: !context.read<GlobalCubit>().isLight?Colors.white12 : Color(0xffadd8e6),

//Color(0xfff5f5f5)

// baseColor: !context.read<GlobalCubit>().isLight? DarkAppColor.foreGroundColors: Colors.grey.shade200,
// highlightColor: !context.read<GlobalCubit>().isLight?Colors.white12 : Colors.grey.shade400,


// baseColor: !context.read<GlobalCubit>().isLight? DarkAppColor.foreGroundColors: Color(0xfff5f5f5),
// highlightColor: !context.read<GlobalCubit>().isLight?Colors.white12 : Color(0xffadd8e6),





