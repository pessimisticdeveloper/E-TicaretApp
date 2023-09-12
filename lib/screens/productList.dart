import 'package:flutter/material.dart';

import '../widgets/productListRow.dart';

class ProductList extends StatelessWidget {
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürünler Listesi",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: _buildProductListPage(),
    );
  }

  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            if (i == 0) {
              return _buildFilterWidgets(screenSize);
            } else if (i == 4) {
              return SizedBox(
                height: 12.0,
              );
            } else {
              return _buildProductListRow();
            }
          }),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton("Sırala"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("Filtrele"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: (){
        print(title);
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildProductListRow() {
    return ProductListRow(
        name: "ÇANTA",
        currentPrice: 150,
        originalPrice: 300,
        discount: 50,
        imageUrl:
            "https://vakko.akinoncdn.com/products/2022/09/26/1371780/2bbebef5-c35c-4c43-a479-f6b2a9dbe3a4.jpg");
  }
}
