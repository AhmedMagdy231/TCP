import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../Loading Widget/loading_widget.dart';

class BuildImage extends StatelessWidget {
   BuildImage({super.key,required this.image,this.radius =0,this.fit = BoxFit.contain,this.borderAll,this.placeHolder,this.alignment=false});

   final String image;
 final double radius;
  final BoxFit? fit;
  final bool? borderAll;
  final bool? alignment;
  Widget? placeHolder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderAll == null? BorderRadius.circular(radius):
      BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit ?? BoxFit.contain,
       // alignment: Alignment.topCenter,
        imageUrl: image,
        alignment: alignment == true?  Alignment.topCenter: Alignment.center,
        placeholder: (context,url) => placeHolder??  Image.asset(
            'assets/images/bg_logo.png',
            fit: BoxFit.cover,
        ),
        errorWidget: (context,url,error) => const Icon(Icons.error,color: Colors.red,),
      ),
    );
  }
}



