class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'] as String,
      img: json['img'] as String,
      price: json['price'] as int,
      people: json['people'] as int,
      stars: json['stars'] as int,
      description: json['description'] as String,
      location: json['location'] as String,
    );
  }
}
