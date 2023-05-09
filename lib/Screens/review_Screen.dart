import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Shop.dart';
import '../widgets/rating_start.dart';

class ScreenReview extends StatefulWidget {
  final Shop shop;
  const ScreenReview({Key key, this.shop}) : super(key: key);

  @override
  State<ScreenReview> createState() => _ScreenReviewState();
}

class _ScreenReviewState extends State<ScreenReview> {
  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          Center(
            child: Text('Review',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                )),
          ),
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                shrinkWrap: true,
                itemCount: widget.shop.reviews.length,
                itemBuilder: (context, index) {
                  return Card(
                    // color: Colors.blueGrey.shade200,
                    // elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(widget
                                    .shop.reviews[index].imageUrl
                                    .toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: SizedBox(
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                        '${widget.shop.reviews[index].name.toString()}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    RatingStart(
                                        rating: widget
                                            .shop.reviews[index].star),
                                  ],
                                )),
                          )
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
