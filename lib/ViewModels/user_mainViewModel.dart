import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:stacked/stacked.dart';

class UserMainViewModel extends BaseViewModel{

  //######################################################################## Home Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Starts    ///////////////////////////////////////////////////////////////////////////////////

  // Categories

  int? selectedCategoryIndex;

  List<String> categoriesImages = [
    ImageUtils.immigration,
    ImageUtils.rtaServices,
    ImageUtils.embassy,
    ImageUtils.visa,
  ];

  List<String> categoriesText = [
    "Immigration",
    "RTA Services",
    "Embassy",
    "Visa"
  ];

  // popular services

  int? selectedPopularServiceIndex;

  List<String> popularServicesAndAgents = [
    "Establishment Card",
    "Card Renewal ",
    "PRO Card",
  ];

  // popular Agents Details

  List<String> popularAgentNames = [
    "Raino C",
    "Mohsin D",
    "Clayo",
    "Salah ",
  ];

  List<String> popularAgentsImages = [
    ImageUtils.agentOne,
    ImageUtils.agentTwo,
    ImageUtils.agentThree,
    ImageUtils.agentFour,
  ];

  // Services and Agents

  List<String> servicesNames = [
    "New Visa",
    "Passport",
    "Permit",
    "Death Certificate",
  ];

  int? selectedServiceIndex;

  // Selected Agent Details

  List<String> agentPlace = [
    "TAS-HEEL",
    "TAW-JEEH",
  ];

  List<String> agentExperienceYears = [
    "2020-2021",
    "2016-2020",
  ];

  // Disputes
  List<String> disputesStatus = [
    "Pending",
    "In Process",
    "Resolved",
    "Cancelled",
  ];

  // Dispute Details
  List<String> documents = [
    ImageUtils.doc,
    ImageUtils.man,
    ImageUtils.laptop,
  ];

  // My Booking
int? myBookingStatus;

}