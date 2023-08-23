import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import '../pages/home_page.dart';
import '../utilities/product_details.dart';
class FlashSale extends StatefulWidget {
  final String subcategoryId;

  const FlashSale({super.key, required this.subcategoryId});

  @override
  State<FlashSale> createState() => _FlashSaleState();
}
class _FlashSaleState extends State<FlashSale> {
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
      'Authorization': 'Basic ${base64Encode(utf8.encode('${Config.key}:${Config.secret}'))}',
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      scrollDirection: Axis.horizontal,
        itemBuilder: (context ,index){
      final product = _products[index];
      return Container(
        margin: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () {

            Get.to(ProductDetails(productId: product['id'].toString(),));
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProductDetails(
            //       productId: product['id'].toString(),
            //     ),),
            // );
          },
          child: CardForHome(
            imgUrl:product['images'][0]['src'],
            productName:product['name'],
            oldPrice: product['regular_price'],
            currentPrice: product['price'],
          ),
        ),
      );
    });
  }
}
