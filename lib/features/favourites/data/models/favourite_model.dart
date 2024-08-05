class FavouriteModel {
  final int id;
  final num price;
  final String title, description, image, category;

  FavouriteModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
  });

  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      id: map['id'],
      price: map['price'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      category: map['category'],
    );
  }

  Map<String , dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'title': title,
      'description': description,
      'image': image,
      'category': category,
    };
  }
}
