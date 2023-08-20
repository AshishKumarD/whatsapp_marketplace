import 'package:uuid/uuid.dart';
import 'productModel.dart';

var uuid = const Uuid();

class CartModel {
  final String id;
  final ProductModel product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  }) : id = uuid.v4();
}
