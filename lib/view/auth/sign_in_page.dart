import 'package:cart_app_synkrama/controller/auth/auth_provider.dart';
import 'package:cart_app_synkrama/view/auth/sign_up_page.dart';
import 'package:cart_app_synkrama/view/home/home_page.dart';
import 'package:cart_app_synkrama/view/root/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, AuthProvider authProvider, child) => Center(
            child: SingleChildScrollView(
              child: Form(
                key: authProvider.signInFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 75 / 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(size: 80),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: authProvider.signInEmailTextController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            var matchCaseOne = RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\$",
                                    caseSensitive: false)
                                .firstMatch(value!);
                            if (value.isEmpty) {
                              return 'Enter email address';
                            } else {
                              if (matchCaseOne != null) {
                                return null;
                              }
                              return 'Not a valid email address';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: authProvider.signInPasswordTextController,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            label: const Text('Password'),
                            border: const OutlineInputBorder(),
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                                child: Icon(obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                          obscureText: obscure,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => authProvider.loginUser(context),
                        child: const Text('Sign In'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        )),
                        child: const Text('Create account'),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot password',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Login using'),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 45 / 100,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              foregroundImage:
                                  AssetImage('assets/images/fb_icon.png'),
                            ),
                            CircleAvatar(
                              foregroundImage:
                                  AssetImage('assets/images/google_logo.png'),
                            ),
                            CircleAvatar(
                              foregroundImage:
                                  AssetImage('assets/images/logo-twitter.png'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
