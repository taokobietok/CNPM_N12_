import 'clothes.dart';
import 'Shop.dart';

class Order {
  final Shop shop;
  final Clothes clothes;
  final String date;
  final int quantity;
  final int price;
  Order({
    this.shop,
    this.clothes,
    this.date,
    this.quantity,
    this.price,
  });
}
