import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:superestaurants/screens/restaurant_list.dart';
import 'package:superestaurants/utils/base_api.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _userCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SupeRestaurants'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _userCodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User code',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  createNewUser();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const RestaurantList();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  //Creation of new user
  createNewUser() async {
    var firstName = _firstNameController.text;
    var lastName = _lastNameController.text;
    var username = _userCodeController.text;
    var password = _passwordController.text;
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty) {
      String url = BASE_API + "users";
      var bodyData = json.encode({
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "password": password,
      });
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: bodyData);
      print(response.statusCode);
      print(response.body);
    }
  }
}