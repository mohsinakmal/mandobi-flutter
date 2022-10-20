import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';

class BookMarkCircle extends StatelessWidget {
  const BookMarkCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorUtils.lightBlue.withOpacity(0.1),
        ),
        padding: EdgeInsets.all(16),
        child: Image.asset(ImageUtils.bookMark,
        width: 4.i,
          height: 4.i,
        )
    );
  }
}
