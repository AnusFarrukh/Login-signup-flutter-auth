import 'package:flutter/material.dart';
import 'package:logsignflutter/components/my_button.dart';
import 'package:logsignflutter/components/my_text_field.dart';
import 'package:logsignflutter/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signIn() async {
//get the auth services
    final authService = Provider.of<AuthService>(
      context,
      listen: false,
    );
    try {
      await authService.signInwithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                //logo
                Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  height: 50,
                ),
                //welcome back message
                Text(
                  "Welcome back you\'ve been missed!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscuretext: false,
                ),
                SizedBox(
                  height: 10,
                ),
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscuretext: true,
                ),
                SizedBox(
                  height: 25,
                ), //signin button
                MyButton(
                  onTap: signIn,
                  text: "Sign In",
                ),
                SizedBox(
                  height: 50,
                ),

                //not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
