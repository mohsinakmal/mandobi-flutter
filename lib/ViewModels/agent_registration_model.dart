import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:stacked/stacked.dart';

class AgentRegistrationModel extends BaseViewModel{

  // Categories

  int? selectedCategoryIndex;

  List<String> categoriesImages = [
    ImageUtils.immigration,
    ImageUtils.rtaServices,
    ImageUtils.embassy,
    ImageUtils.visa,
    ImageUtils.categoriesEdit,
  ];

  List<String> categoriesText = [
    "Immigration",
    "RTA \nServices",
    "Embassy",
    "Visa",
    "Miscellaneous"
  ];

  // Profile Creation Services


}