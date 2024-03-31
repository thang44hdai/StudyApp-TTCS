import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorResources {
  
  static Color mainBackGround(){
    return Color(0xFFECF1EF);
  }
  static Color getPrimaryColor() {
    return Get.isDarkMode ? Colors.green : Color(0xFF039D55);
  }

  static Color getPrimaryTextColor() {
    return Get.isDarkMode ? Color(0xFF8dbac3) : Color(0xFF34C434);
  }

  static Color getSecondaryHeaderColor() {
    return Get.isDarkMode ? Color(0xFFaaa818) : Color(0xFFCFEC7E);
  }

  static Color getGreyColor() {
    return Get.isDarkMode ? Color(0xFF6f7275) : Color(0xFFA0A4A8);
  }

  static Color getGreyBaseGray1() {
    return Get.isDarkMode ? Color(0xFFd3d3d8) : Color(0xFF8E8E93);
  }

  static Color getLightGray() {
    return Get.isDarkMode ? Color(0xdbdbdb) : Color(0xFFF3F3F3);
  }

  static Color getAcceptBtn() {
    return Get.isDarkMode ? Color(0xFF065802) : Color(0xFF95CD41);
  }

  static Color getGreyBaseGray3() {
    return Get.isDarkMode ? Color(0xFF757575) : Color(0xFFC7C7CC);
  }

  static Color getGreyBaseGray4() {
    return Get.isDarkMode ? Color(0xFFe3e3e8) : Color(0xFFD1D1D6);
  }

  static Color getGreyBaseGray6() {
    return Get.isDarkMode ? Color(0xFFb2b5c8) : Color(0xFFF2F2F7);
  }

  static Color getSearchBg() {
    return Get.isDarkMode ? Color(0xFF585a5c) : Color(0xFFF4F7FC);
  }

  static Color getBackgroundColor() {
    return Get.isDarkMode ? Color(0xFF343636) : Color(0xFFFAFAFA);
  }

  static Color getBlackAndWhite() {
    return Get.isDarkMode ? Color(0xFFFFFFFF) : Color(0xFF606060);
  }

  static Color getWhiteAndBlack() {
    return Get.isDarkMode ? Color(0xFF000000) : Color(0xFFFFFFFF);
  }

  static Color getLightAndDark() {
    return Get.isDarkMode
        ? Theme.of(Get.context!).cardColor
        : Color(0xFF000000);
  }

  static Color getOccupationCardColor() {
    return Get.isDarkMode ? Color(0xFF3c3c3c) : Color(0xFFFFFFFF);
  }

  static Color getHintColor() {
    return Get.isDarkMode ? Color(0xFF98a1ab) : Color(0xFF808080);
  }

  static Color getGreyBunkerColor() {
    return Get.isDarkMode ? Color(0xFFE4E8EC) : Color(0xFF25282B);
  }

  static Color getTextColor() {
    return Get.isDarkMode ? Color(0xFFE4E8EC) : Color(0xFF25282B);
  }

  static Color getAcceptTextColor() {
    return Get.isDarkMode ? Color(0xFF25282B) : Color(0xFFE4E8EC);
  }

  static Color getNoteTextColor() {
    return Get.isDarkMode ? Color(0xFF25282B) : Color(0xFF14684E);
  }

  ////
  ///
  static Color getWhiteColor() {
    return Get.isDarkMode ? Color(0xFF000000) : Color(0xFFFFFFFF);
  }

  static Color getBlackColor() {
    return Get.isDarkMode ? Color(0xFFFFFFFF) : Color(0xFF000000);
  }

  static Color getTransactionTitleColor() {
    return Get.isDarkMode ? Color(0xFF71a8c1) : Color(0xFF174061);
  }

  static Color getTransactionTrilingColor() {
    return Get.isDarkMode ? Color(0xFF84b1cc) : Color(0xFF344968);
  }

  static Color getWebsiteTextColor() {
    return Get.isDarkMode ? Color(0xFF84b1cc) : Color(0xFF344968);
  }

  static Color getBalanceTextColor() {
    return Get.isDarkMode ? Color(0xFFd7d7d7) : Color(0xFF393939);
  }

  static Color getShadoColor() {
    return Get.isDarkMode ? Color(0xFFededed) : Color(0xFF848484);
  }

  //card.
  static Color getAddMoneyCardColor() {
    return Get.isDarkMode ? Color(0xFF398343) : Color(0xFFACD9B3);
  }

  static Color getCashOutCardColor() {
    return Get.isDarkMode ? Color(0xFFf57a00) : Color(0xFFFFCB66);
  }

  static Color getRequestMoneyCardColor() {
    return Get.isDarkMode ? Color(0xFFa900a0) : Color(0xFFF6BDE9);
  }

  static Color getReferFriendCardColor() {
    return Get.isDarkMode ? Color(0xFF0083cf) : Color(0xFFADE4FD);
  }

  static Color getOthersCardColor() {
    return Get.isDarkMode ? Color(0xFF3137c9) : Color(0xFFD0C5FF);
  }

  static Color getShadowColor() {
    return Get.isDarkMode ? Color(0xFFeeeeee) : Color(0xFF757575);
  }

  //onboarding
  static Color getOnboardingBgColor() {
    return Get.isDarkMode ? Color(0xFF4a5361) : Color(0xFFD1D5DB);
  }

  static Color getOnboardGreyColor() {
    return Get.isDarkMode ? Color(0xFFe9e8f5) : Color(0xFF6D6D78);
  }

  static Color getDividerColor() {
    return Get.isDarkMode ? Color(0xFFd9d9d9) : Color(0xFF434343);
  }

  static Color getSupportScreenTextColor() {
    return Get.isDarkMode ? Color(0xFFe6e6e6) : Color(0xFF484848);
  }

  static Color getLightGrey() {
    return Get.isDarkMode ? Color(0xFF686868) : Color(0xFFF8F8F8);
  }

  static Color getOtpFieldColor() {
    return Get.isDarkMode ? Color(0xFF6a6e81) : Color(0xFFF2F2F7);
  }

  static Color getRedColor() {
    return Get.isDarkMode ? Color(0xFFbd0a00) : Color(0xFFff795b);
  }

  ///#686868
  static const Color COLOR_PRIMARY = Color(0xFF003E47);
  static const Color COLOR_GREY = Color(0xFFA0A4A8);
  static const Color COLOR_BLACK = Color(0xFF000000);
  static const Color COLOR_LIGHT_BLACK = Color(0xFF4A4B4D);
  static const Color COLOR_WHITE = Color(0xFFFFFFFF);
  static const Color COLOR_TAB = Color(0xFFFFFFFF);
  static const Color COLOR_HINT = Color(0xFF52575C);
  static const Color SEARCH_BG = Color(0xFFF4F7FC);
  static const Color COLOR_GRAY = Color(0xff6E6E6E);
  static const Color COLOR_OXFORD_BLUE = Color(0xff282F39);
  static const Color COLOR_GAINSBORO = Color(0xffE8E8E8);
  static const Color COLOR_NIGHER_RIDER = Color(0xff303030);
  static const Color BACKGROUND_COLOR = Color(0xffE5E5E5);
  static const Color COLOR_GREY_BUNKER = Color(0xff25282B);
  static const Color COLOR_GREY_CHATEAU = Color(0xffA0A4A8);
  static const Color BORDER_COLOR = Color(0xFFDCDCDC);
  static const Color DISABLE_COLOR = Color(0xFF979797);
  static const Color INNER_BORDER_COLOR = Color(0xFFE4E4E4);
  static const Color BACKGROUND_BAR_LIGHT_GRAY = Color(0xFFF8F8F8);

  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };
  static const List<Color> ssColor = [
    Color(0xFF008926),
    Color(0xFF5CAE7F),
    Color(0xFF008926),
    Color(0xFF008926),
    Color(0xFF5CAE7D),
    Color(0xFF008926),
  ];

  //
  static Color secondaryColor = const Color(0xFFE0EC53);
  static Color primaryColor = const Color(0xFF003E47);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF000000);
  static Color gradientColor = const Color(0xFF45A735);
  static Color backgroundColor = const Color(0xFFE5E5E5);
  static Color balanceTextColor = const Color(0xFF393939);
  static Color cardOrangeColor = const Color(0xFFFFCB66);
  static Color cardPinkColor = const Color(0xFFF6BDE9);
  static Color cardPestColor = const Color(0xFFACD9B3);
  static Color containerShedow = const Color(0xFF757575);
  static Color websiteTextColor = const Color(0xFF344968);
  static Color nevDefaultColor = const Color(0xFFAAAAAA);
  static Color blueColor = const Color(0xFF5680F9);
  static Color textFieldColor = const Color(0xFFF2F2F6);
  static Color otpFieldColor = const Color(0xFFF2F2F7);
  static Color redColor = const Color(0xFFFF0000);
  static Color phoneNumberColor = const Color(0xFF484848);
  static Color themeLightBackgroundColor = const Color(0xFFFAFAFA);
  static Color themeDarkBackgroundColor = const Color(0xFF343636);

  //other info
  //#6a6e81
  static Color genderDefaultColor = const Color(0xFFe3f3fd);
  static Color hintColor = const Color(0xFF8E8E93);
  static Color textFieldBorderColor = const Color(0xFFD1D1D6);

//shimmer Color
  static Color shimmerBaseColor = Colors.grey[350]!;
  static Color shimmerLightColor = Colors.grey[200]!;

  /// qr code scanner screen
  static Color containerColor = const Color(0xFFD1D1D6);
}
