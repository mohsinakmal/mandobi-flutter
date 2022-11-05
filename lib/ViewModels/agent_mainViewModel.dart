
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:stacked/stacked.dart';

class AgentMainViewModel extends BaseViewModel{

  //######################################################################## Home Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Starts    ///////////////////////////////////////////////////////////////////////////////////

  // Home Bookings

  List homeBookingColors = [
    {
      "container11" : ColorUtils.golden4,
      "container12" : ColorUtils.golden3,
    },
    {
      "container11" : ColorUtils.lightBlue8,
      "container12" : ColorUtils.lightBlue3,
    },
    {
      "container11" : ColorUtils.lightGreen6,
      "container12" : ColorUtils.lightGreen1,
    },
    {
      "container11" : ColorUtils.red3,
      "container12" : ColorUtils.red,
    }
  ];

  List<String> homeBookingTitle = [
    "Pending",
    "In Process",
    "Completed",
    "Cancel",
  ];

  List<String> homeBookingCount = [
    "12",
    "05",
    "32",
    "01",
  ];

  List<String> homeBookingIcons = [
    ImageUtils.bookingClockIcon,
    ImageUtils.bookingProcessIcon,
    ImageUtils.bookingCompleteIcon,
    ImageUtils.bookingCancelIcon,
  ];

  // Recent Bookings

  List<String> recentBookingStatus = [
    "Process",
    "Pending",
    "Completed"
  ];
}