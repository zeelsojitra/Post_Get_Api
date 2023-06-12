import 'dart:convert';

import 'package:all_api_practic/post/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/post_login_model.dart';
import '../service/post_login_service.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                // Add any additional phone number validation logic here
                return null;
              },
              onSaved: (value) {
                _phoneNumber = value!.trim();
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
                  return 'Please enter your password';
                }
                // Add any additional password validation logic here
                return null;
              },
              onSaved: (value) {
                _password = value!.trim();
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  LoginModel model = LoginModel();
                  model.password = _password;
                  model.email = _phoneNumber;
                  model.deviceType = "MOB";
                  model.clientKey = "1595922666X5f1fd8bb5f662";

                  String? msg =
                      await LoginService.login(reqbody: model.toJson());
                  if (msg == "Login successfully.") {
                    SharedPreferences sh =
                        await SharedPreferences.getInstance();
                    sh
                        .setString("Login", _phoneNumber)
                        .then((value) => Get.to(HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(msg ?? "User does not exist.")));
                  }
                  // Perform login/authentication logic here
                  // For example, you can make an API call to verify credentials
                  // and navigate to the home page if successful
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
