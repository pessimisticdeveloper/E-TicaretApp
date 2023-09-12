import 'package:eticaretapp/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget {
  late String name;
  late int currentPrice;
  late int originalPrice;
  late int discount;
  late String imageUrl;

  ProductListRow(
      {required this.name,
      required this.currentPrice,
      required this.originalPrice,
      required this.discount,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(imageUrl),
              height: 250.0,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.name.toUpperCase(),
                    style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        this.currentPrice.toString() + " ₺",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        this.originalPrice.toString() + " ₺",
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "% " + this.discount.toString(),
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        width: 8.0,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
