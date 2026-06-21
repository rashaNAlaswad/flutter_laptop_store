class Laptop {
  final int id;
  final String name;
  final double price;
  final String image;
  final double rating;
  final int quantity;
  final bool isFavourite;

  const Laptop(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      this.quantity = 0,
      this.isFavourite = false});

  Laptop copyWith({
    int? quantity,
    bool? isFavourite,
  }) {
    return Laptop(
      id: id,
      name: name,
      price: price,
      image: image,
      rating: rating,
      quantity: quantity ?? this.quantity,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
