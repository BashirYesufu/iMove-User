import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_move_user/screens/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  static const String screenID = 'register';

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  TextField makeTextField({required String label, required TextInputType input, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      keyboardType: input,
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
                'Register as a Rider',
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
                    makeTextField(
                        label: 'Full Name',
                        input: TextInputType.text,
                        controller: nameTextEditingController
                    ),

                    SizedBox(height: 10.0,),
                    makeTextField(
                        label: 'Phone Number',
                        input: TextInputType.phone,
                        controller: phoneTextEditingController
                    ),

                    SizedBox(height: 10.0,),
                    makeTextField(
                        label: 'Email',
                        input: TextInputType.emailAddress,
                        controller: emailTextEditingController
                    ),

                    SizedBox(height: 10.0,),
                    makeTextField(
                        label: 'Password',
                        input: TextInputType.emailAddress,
                        controller: passwordTextEditingController
                    ),

                    SizedBox(height: 40.0,),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Create Account',
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
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.screenID, (route) => false);
                },
                child: Text(
                  'Already have an account? Login here.',
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
