import 'package:cart_app_synkrama/controller/auth/auth_provider.dart';
import 'package:cart_app_synkrama/controller/profile/profile_provider.dart';
import 'package:cart_app_synkrama/repository/hive_helper.dart';
import 'package:cart_app_synkrama/view/root/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveHelper = HiveHelper.getInstance();
  await hiveHelper.initHive(); // Initialize Hive
  await hiveHelper.openBox('users');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
