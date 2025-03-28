class House {
  final String id;
  final String imagePath;
  final String title;
  final String price;
  final String description;
  final String area;
  final String quantity;
  final String detailedDescription;
  final List<String> keyFeatures;
  final String location;
  final bool isFavorite;
  final bool isSaved;

  const House({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
    required this.area,
    required this.quantity,
    required this.detailedDescription,
    required this.keyFeatures,
    required this.location,
    this.isFavorite = false,
    this.isSaved = false,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      title: json['title'] as String? ?? 'No Title',
      price: json['price'] as String? ?? 'No Price',
      description: json['description'] as String? ?? '',
      area: json['area'] as String? ?? '',
      quantity: json['quantity'] as String? ?? '',
      detailedDescription: json['detailedDescription'] as String? ?? '',
      keyFeatures: (json['keyFeatures'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      location: json['location'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
      isSaved: json['isSaved'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'title': title,
      'price': price,
      'description': description,
      'area': area,
      'quantity': quantity,
      'detailedDescription': detailedDescription,
      'keyFeatures': keyFeatures,
      'location': location,
      'isFavorite': isFavorite,
      'isSaved': isSaved,
    };
  }

  House copyWith({
    String? id,
    String? imagePath,
    String? title,
    String? price,
    String? description,
    String? area,
    String? quantity,
    String? detailedDescription,
    List<String>? keyFeatures,
    String? location,
    bool? isFavorite,
    bool? isSaved,
    double? rating,
  }) {
    return House(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      area: area ?? this.area,
      quantity: quantity ?? this.quantity,
      detailedDescription: detailedDescription ?? this.detailedDescription,
      keyFeatures: keyFeatures ?? this.keyFeatures,
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  String toString() {
    return 'House{id: $id, title: $title, price: $price, isFavorite: $isFavorite}';
  }
}
