import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemCard extends StatelessWidget {
  final String productImage, productName, productDescription;
  final int productPrice;

  ItemCard(
      {@required this.productImage,
      @required this.productName,
      @required this.productDescription,
      @required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: CachedNetworkImage(
                imageUrl: productImage,
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height as double) / 50,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height as double) / 60,
                  ),
                  Text(
                    "Description: ${productDescription}",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height as double) / 60,
                  ),
                  Text(
                    "Price : ${productPrice} ₹",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
