import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:Clothes_ICTU/Screens/HomeForm.dart';
import 'package:Clothes_ICTU/Screens/Search_Page.dart';
import 'package:Clothes_ICTU/Screens/screen_shop.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../cart_provider.dart';
import '../data/data.dart';
import '../models/Shop.dart';
import '../widgets/rating_start.dart';
import '../widgets/recent_oders.dart';
import 'CartScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Shop> _nhahang = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _nhahang = shop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors. customBlue,
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeForm()));
            },
          ),
          title: Text('THOI TRANG'),
          // nút bấm giỏ hàng
          actions: <Widget>[
            badges.Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.getCounter().toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                },
              ),
              position: const BadgePosition(start: 30, bottom: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          RecentOders(),
          SizedBox(height: 2.0),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Danh sách shop',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 45),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                        },
                      )),
                ],
              )),
          SizedBox(height: 2.0),
          Expanded(
              child: _nhahang.length > 0
                  ? ListView.builder(
                      itemCount: _nhahang.length,
                      itemBuilder: (context, index) {
                        return _buildRestaurant(shop: _nhahang[index]);
                      })
                  : Center(child: Text('No data')))
        ],
      ),
    );
  }

  _buildRestaurant({Shop shop}) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ShopScreen(shop: shop),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            )),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: shop.imageUrl,
                child: Image(
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage(shop.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    shop.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingStart(rating: shop.rating),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    shop.address,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
