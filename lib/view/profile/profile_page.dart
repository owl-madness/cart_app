import 'package:cart_app_synkrama/controller/profile/profile_provider.dart';
import 'package:cart_app_synkrama/utilities/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ProfileProvider profileProvider, child) =>
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.person_pin,
                    size: 120,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppConstants.userDataModelStatic.name.toUpperCase() ?? '',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppConstants.userDataModelStatic.email.toUpperCase() ?? '',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 350),
                  GestureDetector(
                    onTap: () =>profileProvider.logoutUser(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Logout', style: TextStyle(color: Colors.black),),
                        Icon(Icons.exit_to_app, color: Colors.red,),
                      ],
                    ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
