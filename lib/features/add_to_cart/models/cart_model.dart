class CartModel {
  final int id;
  final String title;
  final String thumbnail;
  final double price;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    this.quantity = 1,
  });

  factory CartModel.fromJson(
      Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'quantity': quantity,
    };
  }
}