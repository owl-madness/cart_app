import 'package:cart_app_synkrama/repository/hive_helper.dart';
import 'package:cart_app_synkrama/repository/user_data_hive.dart';
import 'package:cart_app_synkrama/view/auth/sign_in_page.dart';
import 'package:cart_app_synkrama/view/auth/sign_up_page.dart';
import 'package:cart_app_synkrama/view/root/root_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkUserLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 120),
            SizedBox(height: 90),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _checkUserLoggedState() async {
    bool logged = HiveHelper.getInstance().get(HiveHelper.loggedStateKey) as bool? ?? false;
    print('logged state ${logged}');
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              logged ? const DashBoardRoot() : const SignInPage(),
        ),
      );
    });
  }
}
