import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_move_user/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String screenID = 'login';

  TextField makeTextField({required String label}) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14.0,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
        ),
      ),
      style: const TextStyle(fontSize: 14.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              const SizedBox(height: 35.0,),
              Image.asset(
                  'images/logo.png',
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),

              const SizedBox(height: 1.0,),
              const Text(
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

                    const SizedBox(height: 10.0,),
                    makeTextField(label: 'Email'),

                    const SizedBox(height: 10.0,),
                    makeTextField(label: 'Password'),

                    const SizedBox(height: 40.0,),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        height: 50.0,
                        child: const Center(
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
                child: const Text(
                  'Do not have an account? Register here.',
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
}
