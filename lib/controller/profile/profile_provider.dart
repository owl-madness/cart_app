import 'package:cart_app_synkrama/repository/hive_helper.dart';
import 'package:cart_app_synkrama/utilities/custom_widget.dart';
import 'package:cart_app_synkrama/view/root/splash_screen.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  void logoutUser(BuildContext context) {
    CustomWidget.showSnackBar('User logging out...', context);
    HiveHelper.getInstance().userLoggedState(false).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          ));
    });
  }
}
