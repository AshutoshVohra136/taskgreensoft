import 'dart:js_interop';

import 'package:task/models/txtfield.dart';
import 'package:flutter/material.dart';
import 'package:task/screen/api_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool authentication = false;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  void checkAuth(TextEditingController userNameController,
      TextEditingController passwordController) {
    if (userNameController.value.isNull || passwordController.value.isNull) {
      authentication = false;
      return;
    }
    if (passwordController.text.length < 6) {
      authentication = false;
      return;
    }

    authentication = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 50,
              ),

              const SizedBox(
                height: 50,
              ),
              Txtfield(
                  controller: userNameController,
                  obscureText: false,
                  hintText: 'username '),
              const SizedBox(
                height: 20,
              ),
              Txtfield(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password'),
              // forget password

              const SizedBox(
                height: 25,
              ),

              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  onPressed: () {
                    // checkAuth(userNameController, passwordController);
                    // authentication
                    //     ?
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ApiScreen(),
                        ));
                    // : const AlertDialog();
                  },
                  child: const Text("Sign In")),
              ElevatedButton(onPressed: () {}, child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
