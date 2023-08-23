import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../category_pages/sub_category_products_of_category_page/product_list.dart';
import '../config/config.dart';
import '../utilities/data.dart';

class HotDeals extends StatefulWidget {
  const HotDeals({Key? key}) : super(key: key);
  @override
  State<HotDeals> createState() => _HotDealsState();
}
class _HotDealsState extends State<HotDeals> {
  List<dynamic> categories = [];
  @override
  void initState() {
    super.initState();
    fetchMainCategories();
  }
  Future<void> fetchMainCategories() async {
    final response = await http.get(
      Uri.parse('${Config.url}/products/categories?parent=613'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('${Config.key}:${Config.secret}'))}',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> fetchedCategories = jsonDecode(response.body);
      setState(() {
        categories = fetchedCategories;
      });
    } else {
      print('Failed to fetch categories. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            ),
        itemBuilder: (_, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Get.to(ProductListWidget(categoryName: category['name'], subcategoryId: (category['id'])));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return ProductListWidget(
              //           categoryName: category['name'],
              //           subcategoryId: (category['id'])
              //       );
              //
              //       // if (index == 0) {
              //       //   return const FaceCare(categoryName: "Face Care",);
              //       // }
              //       // else if (index == 1) {
              //       //   return const EyeCare(categoryName:"Eye Care");
              //       // }
              //       //     else if (index == 2) {
              //       //   return const BodyCare(categoryName: "Body Care");
              //       // } else if (index == 3) {
              //       //   return const SkinCareIngredients(categoryName: "Skin Care Ingredients");
              //       // } else {
              //       //   return const SkinConcern(categoryName: "Skin Concern",);
              //       //}
              //     },
              //   ),
              // );
            },
            child: Container(
              height: 110,
              width: 110,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                //color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 3,
                    color: const Color(0xFFEBF0FF),
                  ),
              ),
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(hotdealsimages[index],fit: BoxFit.cover,height: 100,
                  width: 100,),
              ),

            ),
          );
        },
      ),
    );
  }
}
