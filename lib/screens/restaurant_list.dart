import 'package:flutter/material.dart';

import '../models/restaurant.dart';
import '../utils/http_helper.dart';
import '../screens/intro.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  int? restaurantsCount;
  List? restaurants;
  HttpHelper? httpHelper;
  @override
  void initState(){
    restaurants = List.empty();
    restaurantsCount = 0;
    httpHelper = HttpHelper();
    initialize();
    super.initState();
  }

  Future initialize() async{
    restaurants = await httpHelper?.getRestaurants();
    setState(() {
      restaurantsCount = restaurants?.length;
      restaurants = restaurants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SupeRestaurants"),
      ),

      body: Padding(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(80, 10, 80, 0),
              //Button to sign out
              child: ElevatedButton(
                child: const Text('Sign out'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Intro();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              //Display list of restaurants
              height: 100000,
              child: ListView.builder(
                  itemCount: (restaurants == null)? 0 : restaurantsCount,
                  itemBuilder: ((context, index) => RestaurantItem(restaurants![index]))
              ),
            )
          ],
        ),
      ),

    );
  }
}

class RestaurantItem extends StatefulWidget{
  final Restaurant restaurant;
  const RestaurantItem(this.restaurant, {super.key});

  @override
  State<RestaurantItem> createState() => _RestaurantItemState();

}

class _RestaurantItemState extends State<RestaurantItem>{
  @override
  Widget build (BuildContext context){
    return Card(
      color: Colors.white,
      elevation: 2.0,
      //Print list of restaurants
      child: ListTile(
        title: Text(widget.restaurant.title!),
        leading: Image(image: NetworkImage(widget.restaurant.poster!)),
      ),
    );
  }
}