import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_move_user/all_widgets/progress_dialog.dart';
import 'package:i_move_user/screens/main_screen.dart';
import 'package:i_move_user/screens/registration_screen.dart';

import '../main.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String screenID = 'login';

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  TextField makeTextField({required String label, required TextEditingController controller}) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
        ),
      ),
      style: TextStyle(fontSize: 14.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [

              SizedBox(height: 35.0,),
              Image.asset(
                  'images/logo.png',
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),

              SizedBox(height: 1.0,),
              Text(
                'Login as a Rider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Bolt-SemiBold'
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(height: 10.0,),
                    makeTextField(label: 'Email', controller: emailTextEditingController),

                    SizedBox(height: 10.0,),
                    makeTextField(label: 'Password', controller: passwordTextEditingController),

                    SizedBox(height: 40.0,),
                    ElevatedButton(
                      onPressed: () {
                        // Login User

                          loginUser(context);

                      },
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'Bolt-SemiBold',
                            ),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.screenID, (route) => false);
                },
                child: Text(
                  'Don\'t have an account? Register here.',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginUser(BuildContext context) async {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(message: "Authenticating, Please wait....",);
      }
    );

    final User? _user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((errorMessage) {
          Navigator.pop(context);
          displayToastMessage("Error: " + errorMessage, context);
    })).user;

    if (_user != null) {
      userReference.child(_user.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.screenID, (route) => false);
          displayToastMessage("User Logged in successfully.", context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage("User does not exist. Create an account.", context);
        }
      });

    } else {
      Navigator.pop(context);
      displayToastMessage("Error signing in user.", context);
    }
  }
}
