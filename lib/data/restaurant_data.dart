import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(
      jsonString,
    ); // decode pega uma string, um texto, que está formatado como um jason e transforma isso em map
    List<dynamic> restaurantsData =
        data['restaurants']; // dynamic diz que essa variavel, em tempo de execução, pode ser de qualquer tipo (como N em outras linguagens)

    for (var restaurantData in restaurantsData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurant.add(restaurant);
    }
  }
}
