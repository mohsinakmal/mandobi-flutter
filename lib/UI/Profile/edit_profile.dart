import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationModel>.reactive(
      viewModelBuilder: () => locator<UserRegistrationModel>(),
      disposeViewModel: false,
      onModelReady: (model){
      },
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: HorizontalMargin(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: context.getPadding().top,),
                      TopMargin(),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.lightBlue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(16),
                              child: SvgPicture.asset(ImageUtils.blueArrow)
                          ),
                          SizedBox(width: 20.w,),
                          Text("Edit Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: 2.t,
                                color: ColorUtils.darkBlue
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        //alignment: Alignment.topCenter,
                        width: 34.8.i,
                        height: 34.8.i,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 32.i,
                              height: 32.i,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorUtils.darkBlue),
                              ),
                              child: ClipOval(
                                  child:
                                  model.editProfileFileImage == null?
                                  /*model.registrationProfileFileImage == null
                                        ? model.usersModel.user_image != null
                                        ? CachedNetworkImage(
                                      imageUrl: model.usersModel.user_image ?? '',
                                      width: 20.i,
                                      height: 20.i,
                                      fit: BoxFit.cover,
                                    )
                                        : */
                                  Center(
                                    child: SvgPicture.asset(
                                      ImageUtils.defaultAvatar,
                                      fit: BoxFit.contain,
                                      width: 10.i,
                                      height: 10.i,
                                    ),
                                  )
                                      : Image.file(
                                    model.editProfileFileImage!,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 2.h),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: PopupMenuButton(
                                  offset: Offset(50, -5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorUtils.blue3,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 1.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SvgPicture.asset(ImageUtils.registerProfileSelectImage),
                                    ),
                                  ),
                                  itemBuilder: (_) => <PopupMenuItem<String>>[
                                    new PopupMenuItem<String>(
                                      child: new Text('Camera'),
                                      value: 'Camera',
                                      onTap: () {
                                        model.registrationProfileOpenCamera();
                                      },
                                    ),
                                    new PopupMenuItem<String>(
                                      child: new Text('Gallery'),
                                      value: 'Gallery',
                                      onTap: () {
                                        model.registrationProfileGetImage();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      CustomTextField(
                        prefixRequired: false,
                        suffixRequired: false,
                        hintText: "Full Name",
                        textInputType: TextInputType.name,
                        controller: model.editProfileNameController,
                      ),
                      SizedBox(height: 2.5.h,),
                      CustomTextField(
                        prefixRequired: false,
                        suffixRequired: false,
                        hintText: "User Name",
                        textInputType: TextInputType.name,
                        controller: model.editProfileUserNameController,
                      ),
                      SizedBox(height: 2.5.h,),
                      CustomTextField(
                        prefixRequired: false,
                        suffixRequired: true,
                        hintText: "Date of Birth",
                        svgImage: ImageUtils.calenderIcon,
                        suffixImageWidth: 10.i,
                        suffixImageHeight: 10.i,
                        textInputType: TextInputType.name,
                        //controller: model.editProfileUserNameController,
                      ),
                      SizedBox(height: 2.5.h,),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          counter: Text(""),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: BorderSide(color: ColorUtils.lightBlue),
                          ),
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'PK',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      SizedBox(height:10.h,),
                      CustomButtonOne(
                        onButtonPressed: (){},
                        textValue: "Continue",
                      )
                      /*InkWell(
                        onTap: (){
                          model.selectDate(context);
                          model.notifyListeners();
                          context.unFocus();
                        },
                        child: Container(
                            height: 7.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(color: ColorUtils.black.withOpacity(0.5)),
                            ),
                            // margin: EdgeInsets.only(
                            //     top: 2.7.h,
                            //     right: 3.5.w,
                            //     left: 3.5.w),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 4.w,
                                        right: 4.w
                                    ),
                                    child: Text(
                                      model.selectedDate == null
                                          ? "Date of Birth"
                                          : DateFormat('yyyy-MM-dd')
                                          .format(model.selectedDate),
                                      style: model.selectedDate == null ? TextStyle(
                                        color: ColorUtils.lightBlue,
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 2.5.t,
                                      )
                                          :
                                      TextStyle(
                                        //color: ColorUtils.blueColor,
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 2.2.t,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 4.w),
                                    child: SvgPicture.asset(
                                      ImageUtils.calenderIcon,
                                      width: 4.5.i,
                                      height: 4.5.i,
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}