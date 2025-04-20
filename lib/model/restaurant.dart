import 'package:myapp/model/dish.dart';

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  int distance;
  List<String> categories;
  List<Dish> dishes;

  Restaurant({
    // (construtor simples) o construtor leva o mesmo nome da classe e passamos o required para dizer que os paramatros sao obrigatorio
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  Map<String, dynamic> toMap() {
    // pegamos algo que já está rodando (como restaurante) e adicionamos na nuvem
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  // usamos factory quando queremos criar um construtor que cria outro construtor
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    // pegamos algo que já está escrito (texto do json) e transformar no restaurante
    return Restaurant(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      dishes: List<Dish>.from(map['dishes'].map((dish) => Dish.fromMap(dish))),
    );
  }

  // toString é um método universal nos objects do flutter. ele é um método que podemos sobreescrever e assim, quando rodarmos um print, ele saberá como mostrar isso na tela
  @override
  String toString() {
    return 'Restaurant(id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance, categories: $categories)';
  }
}
