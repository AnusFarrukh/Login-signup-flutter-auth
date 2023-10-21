import 'package:flutter/material.dart';
import 'package:logsignflutter/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //signuserOut
  void signOut() {
    //get auth service here
    final authService = Provider.of<AuthService>(
      context,
      listen: false,
    );
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
