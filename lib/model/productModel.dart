import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final String seller;
  final bool isAvailable;

  ProductModel({
    required this.seller,
    required this.name,
    required this.price,
    required this.image,
    this.isAvailable = true,
  }) : id = uuid.v4();
}
