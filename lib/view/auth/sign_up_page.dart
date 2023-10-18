import 'package:cart_app_synkrama/controller/auth/auth_provider.dart';
import 'package:cart_app_synkrama/view/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, AuthProvider authProvider, child) => Center(
            child: SingleChildScrollView(
              child: Form(
                key: authProvider.signupFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 75 / 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(size: 80),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: authProvider.signupNameTextController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your Name',
                            label: Text('Name'),
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: authProvider.signupEmailTextController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
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
                          controller: authProvider.signupPasswordTextController,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            label: Text('Password'),
                            border: OutlineInputBorder(),
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
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value?.isEmpty ?? true) {
                              return 'Please enter password';
                            } else {
                              if (!regex.hasMatch(value!)) {
                                return 'Enter valid password';
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller:
                              authProvider.signupConfirmPasswordTextController,
                          decoration: const InputDecoration(
                              hintText: 'Confirm your password',
                              label: Text('Confirm password'),
                              border: OutlineInputBorder()),
                          obscureText: true,
                          validator: (value) {
                            if (authProvider
                                    .signupPasswordTextController.text ==
                                value) {
                              return null;
                            }
                            return 'Password not matching';
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(children: [
                        Checkbox(
                          value: authProvider.termsAndConditionCheck,
                          onChanged: (value) => authProvider
                              .onTermsAndConditionCheckClicked(value ?? false),
                        ),
                        const Text(
                          'Terms & Conditions',
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                      ElevatedButton(
                        onPressed: () => authProvider.signupUser(context),
                        child: const Text('Sign up'),
                      ),
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
