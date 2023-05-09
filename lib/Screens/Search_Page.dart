import 'package:flutter/material.dart';
import 'package:Clothes_ICTU/Screens/HomeForm.dart';
import 'package:Clothes_ICTU/Screens/screen_shop.dart';

import '../data/data.dart';
import '../models/Shop.dart';
import '../widgets/rating_start.dart';
import '../widgets/recent_oders.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Shop> _shop = [];
  final TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      _shop = shop;
    });
  }

// phần lọc dữ liệu của search
  void onSearch(String value) {
    List<Shop> results = [];
    results = shop;
    results = shop
        .where((tennhahang) =>
            tennhahang.name.toString().toLowerCase().contains(value))
        .toList();
    setState(() {
      _shop = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Container(
          child: TextField(
            controller: _controller,
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.0),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Tìm shop',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  color: Theme.of(context).primaryColor,
                  // nút bấm xóa thanh search
                  onPressed: () {
                    _controller.clear;
                  },
                )),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Expanded(
              child: _shop.length > 0
                  ? ListView.builder(
                      itemCount: _shop.length,
                      itemBuilder: (context, index) {
                        return _buildRestaurant(shop: _shop[index]);
                      })
                  : Center(child: Text('Không có shop.')))
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
