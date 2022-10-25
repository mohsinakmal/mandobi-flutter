import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';

class MyCustomDialog extends StatelessWidget {

  Widget? childWidget;

  MyCustomDialog({this.childWidget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      //contentPadding: EdgeInsets.only(bottom: 3.h, top: 0.h),
      insetPadding:
      EdgeInsets.symmetric(horizontal: 4.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(3.i))),
      children: [
        Container(
          width: MediaQuery.of(context)
              .size
              .width /
              1,
          child: Column(
            children: [
              Align(
                alignment:
                Alignment.centerRight,
                child: Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 2.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.red
                            .withOpacity(0.1),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.all(
                            10.0),
                        child: SvgPicture.asset(
                            ImageUtils.redCross),
                      ),
                    ),
                  ),
                ),
              ),
              childWidget!,
            ],
          ),
        )
      ],
    );
  }
}
