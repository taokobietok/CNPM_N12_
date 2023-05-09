import 'package:Clothes_ICTU/models/review.dart';

import './clothes.dart';

class Shop {
  final String imageUrl;
  final String name;
  final String address;
  int rating;
  final List<Clothes> menu;
  List<Review> reviews;

  Shop({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
    this.reviews,
  });
}
