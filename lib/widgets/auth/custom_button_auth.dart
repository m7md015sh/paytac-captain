import 'package:flutter/material.dart';
import 'package:paytac_captain/utils/colors.dart';
import 'package:paytac_captain/utils/dimensions.dart';



class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtonAuth({Key? key,required this.text,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(top: Dimensions.height20!),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius30!)),
        padding: EdgeInsets.symmetric(vertical: Dimensions.height15!),
        onPressed: onPressed,child: Text(text,style: TextStyle(fontSize: Dimensions.font20,fontFamily: 'Cairo'),),color: AppColors.mainColor,textColor: Colors.white,),
    );
  }
}
