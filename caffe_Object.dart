class CaffeOject {
  final int id;
  final String name;
  final int price;
  final String description;
  final String picture;

  CaffeOject({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.picture,
  });

  CaffeOject.fromJson(Map<String, dynamic> r)
      : id = r['id'],
        name = r['name'],
        price = r['price'],
        description = r['description'],
        picture = r['picture'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'picture': picture,
    };
  }
}
