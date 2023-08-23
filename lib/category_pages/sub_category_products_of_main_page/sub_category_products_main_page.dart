import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../../config/config.dart';
import '../../pages/home_page.dart';
class SubCategoryProductMainPage extends StatefulWidget {
  final String subcategoryId;
  const SubCategoryProductMainPage({super.key, required this.subcategoryId});

  @override
  State<SubCategoryProductMainPage> createState() => _SubCategoryProductMainPageState();
}

class _SubCategoryProductMainPageState extends State<SubCategoryProductMainPage> {
  List<dynamic> _products = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getSubcategoryAllProduct();
  }

  Future<void> getSubcategoryAllProduct() async {
    setState(() {
      _isLoading = true;
    });

    final url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=${widget.subcategoryId}';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _products = jsonDecode(response.body);
        _isLoading = false;
      });
    } else {
      // Handle API error
      print('Failed to fetch products. Error: ${response.statusCode}');
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1410,
      margin: const EdgeInsets.all(5),
      //color: Colors.red,
      child: GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              mainAxisExtent: 350),
          itemBuilder: (context, index) {
            final product = _products[index];
            return  CardForHome(
              imgUrl:product['img'][0]['src'],
              productName:product['name'],
              oldPrice:product['regular_price'],
              currentPrice: product['price'],
            );
          }),
    );

  }
}
