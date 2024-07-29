class ProductModel {
  final int id;
  final String title, description, category, images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      images: json['images'][0],
    );
  }
}
