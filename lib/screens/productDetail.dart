import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.white,
            )),
        backgroundColor: Colors.redAccent,
        title: Text(
          "Ürün Detayı",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImages(),
              _buildProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildProductPrice(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(),
              SizedBox(
                height: 12.0,
              ),
              _buildInfo()
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                TabBarView(
                  controller: imagesController,
                  children: [
                    Image.network(
                        "https://vakko.akinoncdn.com/products/2022/09/02/1371778/20843fe1-52c4-40d3-9f5c-36b3e41af38f_size650x980_cropCenter.jpg"),
                    Image.network(
                        "https://vakko.akinoncdn.com/products/2022/09/26/1371777/07c5b00f-5218-403f-96c1-ceaaac2e3107_size650x980_cropCenter.jpg"),
                    Image.network(
                        "https://vakko.akinoncdn.com/products/2022/09/26/1371780/2bbebef5-c35c-4c43-a479-f6b2a9dbe3a4.jpg"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.red,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Text(
            "150 ₺",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "300 ₺",
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.red,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\% 50 indirim",
            style: TextStyle(fontSize: 12.0, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  _buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          "Vakko Çanta",
          style: TextStyle(fontSize: 15, color: Colors.deepOrange),
        ),
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          width: screenSize.width,
          height: 0.50,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.local_offer,
            color: Colors.red,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Daha Fazla Bilgi İçin Tıklayınız",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.straighten,
                color: Colors.red,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Beden: XS",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Beden Tablosu",
                style: TextStyle(fontSize: 12.0, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: [
          TabBar(controller: tabController, indicatorColor: Colors.red, tabs: [
            Tab(
              child: Text(
                "Ürün Bilgisi",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                "Yıkama Bilgisi",
                style: TextStyle(color: Colors.black),
              ),
            )
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 40.0,
            child: TabBarView(controller: tabController, children: [
              Text(
                "Yılan derisi ve ceylan derisinden ",
                style: TextStyle(fontSize: 12.0, color: Colors.red),
              ),
              Text(
                "Yıkanmaz sadece silinir... ",
                style: TextStyle(fontSize: 12.0, color: Colors.red),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
                onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.list,color: Colors.red,),
                  SizedBox(width: 4.0,),
                  Text("İstek",style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  SizedBox(width: 4.0,),
                  Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
