import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/Widgets/back_arrow.dart';

class AppBarTwoItems extends StatelessWidget {

  final String? text;

  AppBarTwoItems({this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        AppBar(
          primary:false,
          titleSpacing: 0,
          leadingWidth: 11.i,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title:
          Text(
            text!,
            style: TextStyle(
                fontFamily: FontUtils.poppinsRegular,
                fontSize: 2.t,
                color: ColorUtils.darkBlue
            ),
          ),
          leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorUtils.lightBlue.withOpacity(0.1),
                ),
                padding: EdgeInsets.all(16),
                child: SvgPicture.asset(ImageUtils.blueArrow)
            ),
          ),
        );
  }
}
