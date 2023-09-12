import 'package:eticaretapp/utilities/constants.dart';
import 'package:eticaretapp/screens/productDetail.dart';
import 'package:flutter/material.dart';

class Routes{

  static final routes = <String,WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL:(BuildContext context) => ProductDetail()
  };
}

