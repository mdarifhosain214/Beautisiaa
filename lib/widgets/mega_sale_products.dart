import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import '../pages/home_page.dart';
import '../utilities/product_details.dart';
class MegaSaleProducts extends StatefulWidget {
  const MegaSaleProducts({super.key});
  @override
  State<MegaSaleProducts> createState() => _MegaSaleProductsState();
}
class _MegaSaleProductsState extends State<MegaSaleProducts> {
  List<dynamic> _products = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchBestSellingProducts();
  }

  Future<void> fetchBestSellingProducts() async {
    setState(() {
      _isLoading = true;
    });

    const url = 'https://beautysiaa.com/wp-json/wc/v3/products?&on_sale=true';
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
      print('Failed to fetch best-selling products. Error: ${response.statusCode}');
      setState(() {
        _isLoading = false;
      });
    }
  }
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
