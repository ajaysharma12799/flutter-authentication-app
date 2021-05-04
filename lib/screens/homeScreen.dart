import 'package:authentication_app/widget/customDrawer.dart';
import 'package:authentication_app/widget/itemCard.dart';
import 'package:authentication_app/model/product_model.dart';
import 'package:authentication_app/data/helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(
            productImage: products[index].productImage,
            productName: products[index].productName,
            productDescription: products[index].productDescription,
            productPrice: products[index].productPrice,
          );
        },
      ),
      drawer: CustomDrawer(),
    );
  }
}
