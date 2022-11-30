import 'package:flutter/material.dart';
import 'package:superestaurants/screens/login.dart';
import 'package:superestaurants/screens/register.dart';

class Intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Intro
    return Scaffold(
      appBar: AppBar(
        title: Text('SupeRestaurants'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(60),
              child: Text(
                'SupeRestaurants',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Login();
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Register();
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
}