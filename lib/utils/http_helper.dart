import "dart:convert";
import "dart:io";

import 'package:http/http.dart' as http;
import '../models/restaurant.dart';
import '../models/User.dart';

class HttpHelper {
  final String urlRestaurants =
      "https://probable-knowledgeable-zoo.glitch.me/restaurants";
  final String urlUsers =
      "https://probable-knowledgeable-zoo.glitch.me/users";

  Future<List?> getRestaurants() async {
    http.Response result = await http.get(Uri.parse(urlRestaurants));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final maps = jsonResponse;
      List restaurants = maps.map((i) => Restaurant.fromJson(i)).toList();
      return restaurants;
    }
    else{
      return null;
    }
  }
  Future<List?> getUsers() async {
    http.Response result = await http.get(Uri.parse(urlUsers));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final maps = jsonResponse;
      List users = maps.map((i) => User.fromJson(i)).toList();
      return users;
    }
    else{
      return null;
    }
  }
}