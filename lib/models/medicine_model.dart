class MedicineModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final int stock;

  MedicineModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.stock,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        id: json['id'],
        name: json['name'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        stock: json['stock'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'stock': stock
      };
}
