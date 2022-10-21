import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("""
"Protecting your private information is our priority. This Privacy Policy governs data collection and usage of Mandobi Mobile System Application and its associated services, software and platform (collectively "Application") provided by Mandobi and any of our affiliates. By using the Application, you consent to the data practices described in this Policy as well as our Terms of Use. If you do not agree to any part of this Privacy Policy, then you should stop accessing the Application.

Collection of your Personal Information
Mandobi may collect personally identifiable information, such as your e-mail address, name, location or telephone number, your personal documents. Mandobi may also collect anonymous demographic information, which is not unique to you, such as your age, gender etc.
Information about your hardware and software also may be automatically collected by Mandobi. This information can include: your IP address, browser type, domain names, access times and referring website addresses. This information is used by the Application for the operation of the service, to maintain a quality of the service, and to provide general statistics regarding use of the Application.

Please keep in mind that if you directly disclose personally identifiable information or personally sensitive data through the Application, this information may be collected and used by the receiver of this personally identifiable information. Mandobi encourages you to review the privacy statements of the Application before you share such personal documents and information. 
Use of your Personal Information

Mandobi collects and uses your personal information to operate the Application and deliver the services you have requested. Mandobi may also use your personally identifiable information to inform you of other products or services available from Mandobi.
Mandobi keeps track of the services our customers access within the Application in order to determine what services are the most popular. This data is used to deliver customized content within the Application to users whose behaviour indicates that they are interested in a particular subject area or services. The Application uses tracking pixels to collect information that helps Mandobi provide the service to you. Please note that any "do not track" signals sent by your web browser or other mechanism have no effect on the collection of personally identifiable information by the Application. In addition, other parties who perform data analytics for the Application, such as Google Analytics, may collect personally identifiable information about your online activities when you use the Application. Third party affiliates of Mandobi may have different policies with respect to "do not track" signals and Mandobi makes no representations with respect to such policies.
Mandobi may disclose personal information when we are required to or we believe it is appropriate to comply with the law (e.g., a lawful subpoena, warrant or court order); to enforce or apply this Privacy Policy or our other policies or agreements; to protect our or our users' rights, property or safety; to protect our users from fraudulent, abusive, or unlawful use of the Website; or if we believe that an emergency involving the danger of death or serious physical injury to any person requires or justifies disclosure of personal information.
Communications with Public Relationship Officers (PRO)
In order to ensure delivery of services and for quality assurance purposes, Mandobi will have access to communications with Participating PROs which are transmitted through the Application. As a result, if you choose to communicate with Participating PRO through the Application, please note that any such communications between you and a Participating PRO may not necessarily be treated as confidential information by the PRO. For additional information, please read the section in our Terms of Use entitled Interactions with Lawyers on the Website.
Use of Cookies
The Application may use "cookies" to help you personalize your online experience. A cookie is a text file that is placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you, and can only be read by a web server in the domain that issued the cookie to you.
One of the primary purposes of cookies is to provide a convenience feature to save you time. The purpose of a cookie is to tell the Application that you have returned to a specific page. For example, if you register an account with the Application, a cookie helps us recall your specific information on subsequent visits. This simplifies the process of recording your personal information. When you return to the Application, the information you previously provided can be retrieved, so you can easily use the features that you customized.
You have the ability to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. If you choose to decline cookies, you may not be able to fully experience the interactive features of the Website.
Security of your Personal Information
You are responsible for safeguarding and preventing unauthorized access to the user information and password that you use to access the Application. You agree not to disclose your password to any third party and you are responsible for any activity using your account, whether or not you authorized that activity. Please immediately notify the Application of any unauthorized use of your account.
The Application secures your personal information from unauthorized access, use or disclosure. In addition, Application secures the personally identifiable information you provide on computer servers in a controlled, secure environment, protected from unauthorized access, use or disclosure. 
Children Under Eighteen
The Application is not intended for use by children under the age of 18, and such use is prohibited by our Terms of Use. We do not knowingly collect personally identifiable information from children under 18. If you become aware that a child has provided us with Personal Information, please contact us as set forth in this Privacy Policy.
Changes to this Privacy Policy
The Application may change the provisions of this Privacy Policy at any time, and will always post the most up-to-date version on the Application.
Contact Information
Mandobi
    """,
      style: TextStyle(
          fontFamily:
          FontUtils.poppinsRegular,
          fontSize: Fontsizes.size10,
          color: ColorUtils.black),
    );
  }
}
