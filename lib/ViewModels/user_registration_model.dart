import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class UserRegistrationModel extends BaseViewModel{

//######################################################################## User Registration ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Start    ///////////////////////////////////////////////////////////////////////////////////

  // Login
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // Register
  XFile? registrationPickedFile;
  File? registrationProfileFileImage;
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerAddressController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController = TextEditingController();

  // Forgot Password
  TextEditingController forgotPasswordController = TextEditingController();


  Future<bool> registrationProfileOpenCamera() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800, imageQuality: 75);
    registrationPickedFile = image;
    registrationProfileFileImage = File(registrationPickedFile!.path);
    // editProfileFileImage = enterDetailsProfileFileImage;
    // enterDetailsProfilePic = enterDetailsProfileFileImage.toString();
    notifyListeners();
    final bytes = (await registrationPickedFile!.readAsBytes()).lengthInBytes;
    print(bytes);
    if (registrationProfileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  Future<bool> registrationProfileGetImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800, imageQuality: 75);
    registrationPickedFile = image;
    registrationProfileFileImage = File(registrationPickedFile!.path);
    notifyListeners();
    if (registrationProfileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

//######################################################################## User Registration ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Ends    ///////////////////////////////////////////////////////////////////////////////////

//######################################################################## Edit Profile ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Start    ///////////////////////////////////////////////////////////////////////////////////

  XFile? editPickedFile;
  File? editProfileFileImage;
  TextEditingController editProfileNameController = TextEditingController();
  TextEditingController editProfileUserNameController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<bool> editProfileOpenCamera() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800, imageQuality: 75);
    editPickedFile = image;
    editProfileFileImage = File(editPickedFile!.path);
    // editProfileFileImage = enterDetailsProfileFileImage;
    // enterDetailsProfilePic = enterDetailsProfileFileImage.toString();
    notifyListeners();
    final bytes = (await editPickedFile!.readAsBytes()).lengthInBytes;
    print(bytes);
    if (editProfileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  Future<bool> editProfileGetImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800, imageQuality: 75);
    editPickedFile = image;
    editProfileFileImage = File(editPickedFile!.path);
    notifyListeners();
    if (editProfileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      selectedDate = picked;
    notifyListeners();
  }

}