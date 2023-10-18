import 'package:cart_app_synkrama/model/user_model.dart';
import 'package:cart_app_synkrama/repository/hive_helper.dart';
import 'package:cart_app_synkrama/utilities/app_constants.dart';
import 'package:cart_app_synkrama/utilities/custom_widget.dart';
import 'package:cart_app_synkrama/view/auth/sign_in_page.dart';
import 'package:cart_app_synkrama/view/auth/sign_up_page.dart';
import 'package:cart_app_synkrama/view/root/root_page.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final signInEmailTextController = TextEditingController();
  final signInPasswordTextController = TextEditingController();
  final signupPasswordTextController = TextEditingController();
  final signupConfirmPasswordTextController = TextEditingController();
  final signupNameTextController = TextEditingController();
  final signupEmailTextController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  bool termsAndConditionCheck = false;

  void onTermsAndConditionCheckClicked(bool value) {
    termsAndConditionCheck = value;
    notifyListeners();
  }

  void loginUser(BuildContext context) {
    print(HiveHelper.getInstance().getBoxValues());
    if (signInFormKey.currentState?.validate() ?? false) {
      var email = signInEmailTextController.text.trim().toLowerCase();
      var exist = HiveHelper.getInstance().get(email);
      if (exist != null) {
        var userData = HiveHelper.getInstance().get(email);
        var password = userData["password"];
        var enteredPassword = signInPasswordTextController.text;
        if (enteredPassword == password) {
          CustomWidget.showSnackBar('Logging in...', context);
          AppConstants.userDataModelStatic = UserDataModel(
              email: email,
              name: userData["name"],
              password: userData["password"]);
          HiveHelper.getInstance().userLoggedState(true);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashBoardRoot(),
              ));
        } else {
          CustomWidget.showSnackBar('Check credentials!!', context);
        }
      } else {
        CustomWidget.showSnackBar(
            'User doesn\'t exist!! Create account', context);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupPage(),
            ));
      }
    } else {
      print('form false');
    }
  }

  signupUser(BuildContext context) {
    if ((signupFormKey.currentState?.validate() ?? false) &&
        termsAndConditionCheck) {
      final hiveHelper = HiveHelper.getInstance();

      hiveHelper.putUser(UserDataModel(
        email: signupEmailTextController.text.trim().toLowerCase(),
        name: signupNameTextController.text.trim(),
        password: signupPasswordTextController.text.trim(),
      ));
      CustomWidget.showSnackBar('Account created, Please sign in!!', context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ));
    } else {
      CustomWidget.showSnackBar(
          termsAndConditionCheck
              ? 'Check form details'
              : 'Accept terms & conditions',
          context);
    }
  }
}
