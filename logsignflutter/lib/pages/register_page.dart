import 'package:flutter/material.dart';
import 'package:logsignflutter/components/my_button.dart';
import 'package:logsignflutter/components/my_text_field.dart';
import 'package:logsignflutter/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //signup user
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do no match!"),
        ),
      );
      return;
    }
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
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
                //create account message
                Text(
                  "Lets's create an account for you!",
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
                  height: 10,
                ),
                //confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  obscuretext: true,
                ),
                SizedBox(
                  height: 25,
                ),
                //signup button
                MyButton(
                  onTap: signUp,
                  text: "Sign Up",
                ),
                SizedBox(
                  height: 50,
                ),

                //not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?"),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now",
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
