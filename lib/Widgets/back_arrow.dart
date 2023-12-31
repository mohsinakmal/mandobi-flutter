import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.lightBlue.withOpacity(0.1),
          ),
          padding: EdgeInsets.all(16),
          child: SvgPicture.asset(ImageUtils.blueArrow)
      ),
    );
  }
}
