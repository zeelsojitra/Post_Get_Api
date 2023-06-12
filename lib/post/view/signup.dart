import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/post_signup_model.dart';
import '../service/post_signup_service.dart';
import 'homepage.dart';
import 'login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _mobile = '';
  String _dob = "";
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstName = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastName = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add email validation logic here (e.g., using regular expressions)
                  return null;
                },
                onSaved: (value) {
                  _email = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  // Add mobile number validation logic here
                  return null;
                },
                onSaved: (value) {
                  _mobile = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dob',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Dob';
                  }
                  // Add password validation logic here (e.g., minimum length)
                  return null;
                },
                onSaved: (value) {
                  _dob = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  // Add password validation logic here (e.g., minimum length)
                  return null;
                },
                onSaved: (value) {
                  _password = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value!.trim();
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  print("111");
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("222");
                    SignUpModel model = SignUpModel();
                    model.clientKey = "1595922666X5f1fd8bb5f662";
                    model.deviceType = "MOB";
                    model.fname = _firstName;
                    model.lname = _lastName;
                    model.email = _email;
                    model.mobile = _mobile;
                    model.dob = _dob;
                    model.password = _password;
                    model.confirmPassword = _confirmPassword;

                    String? msg =
                        await SingUpService.singup(reqbody: model.toJson());
                    if (msg == "Data has been created.") {
                      SharedPreferences sh =
                          await SharedPreferences.getInstance();
                      sh
                          .setString("SignUp", _mobile)
                          .then((value) => Get.to(HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(msg ?? "User email already exist.")));
                    }
                    // Perform signup logic here
                    // For example, you can make an API call to register the user
                    // and navigate to the home page if successful
                  }
                },
                child: Text('Signup'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: Text("Login!")),
            ],
          ),
        ),
      ),
    );
  }
}
