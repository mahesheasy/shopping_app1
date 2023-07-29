class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
    final double rate;
  final int count;
  ProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.rate,
      required this.count,
      });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      description: json['description'],
      imageUrl: json['image'],
      name: json['name'],
      price: json['price'],
      rate: json['rating']['rate'],
      count: json['rating']['count']
    );
  }
}
