import 'package:flutter/material.dart';
import 'package:authentication_app/data/helper.dart';
import 'package:authentication_app/model/product_model.dart';
import 'package:authentication_app/widget/itemCard.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return ItemCard1(
              title: products[index].productName,
              description: products[index].productDescription,
              imageUrl: products[index].productImage,
              price: products[index].productPrice,
            );
          }),
    );
  }
}
