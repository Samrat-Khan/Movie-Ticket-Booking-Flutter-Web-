import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/Screens/Movie_Add_ByAdmin/Add_Movie.dart';

class SignInSignUp extends StatefulWidget {
  @override
  _SignInSignUpState createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Movie Booking"),
            TextButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMovie(),
                ),
              ),
              icon: Icon(Icons.ac_unit),
              label: Text("Sign in with"),
            ),
          ],
        ),
      ),
    );
  }
}
