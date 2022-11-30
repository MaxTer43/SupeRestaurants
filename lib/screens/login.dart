import 'package:flutter/material.dart';
import 'package:superestaurants/screens/restaurant_list.dart';
import '../models/user.dart';
import '../utils/http_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  int? usersCount;
  List? users;
  HttpHelper? httpHelper;
  @override
  void initState(){
    users = List.empty();
    usersCount = 0;
    httpHelper = HttpHelper();
    initialize();
    super.initState();
  }

  Future initialize() async{
    users = await httpHelper?.getRestaurants();
    setState(() {
      usersCount = users?.length;
      users = users;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _usernameController,
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
                child: const Text('Login'),
                onPressed: () {
                  validateCredentials();
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
  //Verification of credentials
  validateCredentials() async {
    var username = _usernameController.text;
    var password = _passwordController.text;
    /*
    for (int i = 0; i < widget.user.username!.length; i++){
      if (widget.user.username![i] == username &&
          widget.user.password![i] == password){
        return true;
      }
    }
    return false;
     */
  }
}
