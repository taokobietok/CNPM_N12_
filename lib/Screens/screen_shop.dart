// import 'package:datdoan/models/clothes.dart';
// import 'package:datdoan/models/Shop.dart';
// import 'package:datdoan/widgets/rating_start.dart';
import 'package:flutter/material.dart';
import 'package:Clothes_ICTU/Screens/review_Screen.dart';
import 'package:provider/provider.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/db_helper.dart';
import '../Model/cart_model.dart';
import '../cart_provider.dart';
import '../models/Shop.dart';
import '../widgets/rating_start.dart';

//đây là cái menu nhà hàng.
class ShopScreen extends StatefulWidget {
  final Shop shop;
  ShopScreen({this.shop});
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: widget.shop.menu[index].id,
          productId: widget.shop.menu[index].id.toString(),
          productName: widget.shop.menu[index].name,
          initialPrice: widget.shop.menu[index].price,
          productPrice: widget.shop.menu[index].price,
          quantity: ValueNotifier(1),
          unitTag: widget.shop.menu[index].shopName,
          image: widget.shop.menu[index].imageUrl,
        ),
      )
          .then((value) {
        cart.addTotalPrice(widget.shop.menu[index].price.toDouble());
        cart.addCounter();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                  tag: widget.shop.imageUrl,
                  child: Image(
                    image: AssetImage(widget.shop.imageUrl),
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.shop.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ScreenReview(shop: widget.shop)),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          textStyle: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: Text("Review",
                          style: TextStyle(

                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
                RatingStart(rating: widget.shop.rating),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.shop.address,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text('Danh sách mặt hàng',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                )),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                shrinkWrap: true,
                itemCount: widget.shop.menu.length,
                itemBuilder: (context, index) {
                  return Card(
                    // color: Colors.blueGrey.shade200,
                    // elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              height: 100,
                              width: 100,
                              image: AssetImage(widget
                                  .shop.menu[index].imageUrl
                                  .toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5.0,
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text: TextSpan(
                                      // text: 'Name: ',
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 16.0),
                                      children: [
                                        TextSpan(
                                            text:
                                                '${widget.shop.menu[index].name.toString()}\n',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                ),
                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade800,
                                          fontSize: 16.0),
                                      children: [
                                        TextSpan(
                                            text:
                                                '${widget.shop.menu[index].price.toString()} đ\n',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 48.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            // nút bấm để thêm vào giỏ hàng
                            child: IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 30,
                              onPressed: () {
                                alertDialog(context,
                                    'Đã thêm ${widget.shop.menu[index].name.toString()} vào giỏ hàng');
                                saveData(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
