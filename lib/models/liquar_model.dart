class LiquarModel {
  final String id;
  final String name;
  final String description;
  final double price;

  LiquarModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory LiquarModel.fromJson(Map<String, dynamic> json) {
    return LiquarModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] is String ? double.parse(json['price']) : json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
