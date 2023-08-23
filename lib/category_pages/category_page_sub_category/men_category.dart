import 'dart:convert';
import '../../config/config.dart';
import '../../const/dimensions.dart';
import '../sub_category_products_of_category_page/sub_category_of_sub_category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../sub_category_products_of_category_page/sub_category_of_sub_category.dart';
class MenCategory extends StatefulWidget {
  const MenCategory({Key? key}) : super(key: key);
  @override
  State<MenCategory> createState() => _MenCategoryState();
}
class _MenCategoryState extends State<MenCategory> {
  List<dynamic> categories = [];
  @override
  void initState() {
    super.initState();
    fetchMainCategories();
  }

  Future<void> fetchMainCategories() async {
    final response = await http.get(
      Uri.parse('${Config.url}/products/categories?parent=54'),
      headers: {
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
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
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.68,
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 175),
        itemBuilder: (_, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SubCategoryOfSubCategory(
                        categoryName: category['name'],
                        subcategoryId: (category['id']).toString());

                    // if (index == 0) {
                    //   return const FaceCare(categoryName: "Face Care",);
                    // }
                    // else if (index == 1) {
                    //   return const EyeCare(categoryName:"Eye Care");
                    // }
                    //     else if (index == 2) {
                    //   return const BodyCare(categoryName: "Body Care");
                    // } else if (index == 3) {
                    //   return const SkinCareIngredients(categoryName: "Skin Care Ingredients");
                    // } else {
                    //   return const SkinConcern(categoryName: "Skin Concern",);
                    //}
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                //border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    category['image']['src'],
                    height: Dimensions.height10*15,
                    width: Dimensions.height10*15,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: Dimensions.height10, top: Dimensions.height10),
                    child: Text(
                      category["name"],
                      style:  TextStyle(
                          fontSize: Dimensions.height10+2,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          letterSpacing: 1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
