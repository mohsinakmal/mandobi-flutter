import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';

Widget SendMsg(BuildContext context , msg){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: ColorUtils.lightBlue,
              border: Border.all(color: ColorUtils.lightBlue,),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , topRight:Radius.circular(10) , bottomLeft: Radius.circular(10) , )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width:MediaQuery.of(context).size.width/1.5,child: Text(msg , style: TextStyle( fontSize: 15 , ),)),
          ),
        ),
      ],
    ),
  );
}