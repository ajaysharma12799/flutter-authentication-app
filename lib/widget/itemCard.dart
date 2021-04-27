import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCard1 extends StatelessWidget {
  final String imageUrl, title, description;
  final int price;

  ItemCard1(
      {@required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 17.0),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: CachedNetworkImage(imageUrl: imageUrl),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 17.0, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
