import 'package:assignment2/utils/images_const.dart';
import 'package:flutter/material.dart';

class LogoW extends StatelessWidget {
const LogoW({super.key,this.width=250,this.height=250});
final double? width;
final double? height;

  @override
  Widget build(BuildContext context){
    return Image.asset(ImagesConst.logo, width:width, height: height);
  }
}