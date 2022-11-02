import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';

Widget ReceiveMsg( BuildContext context , msg){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
              color: ColorUtils.white,
              border: Border.all(color: ColorUtils.lightGreen),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , topRight:Radius.circular(10) , bottomRight: Radius.circular(10) , )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width:MediaQuery.of(context).size.width/1.5,child: Text(msg , style: TextStyle( fontSize: 15 , color: Colors.black ),)),
          ),
        ),

      ],
    ),
  );
}