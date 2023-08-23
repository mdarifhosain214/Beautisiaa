import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_beautisaiaa_app/const/dimensions.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../../app_colors.dart';
import '../../config/config.dart';
import 'product_list.dart';
class SubCategoryOfSubCategory extends StatefulWidget {
  final String categoryName;
  final String subcategoryId;
  const SubCategoryOfSubCategory({super.key, required this.categoryName, required this.subcategoryId});
  @override
  _SubCategoryOfSubCategoryState createState() => _SubCategoryOfSubCategoryState();
}
class _SubCategoryOfSubCategoryState extends State<SubCategoryOfSubCategory> {
  final String baseUrl = 'https://beautysiaa.com/wp-json/wc/v3';
  final String consumerKey ='ck_d965727e9530eff7b29344694a3aee2a3fc12624';
  final String consumerSecret = 'cs_bc8b1f3c7873e490826448454059839c279eb66e';
  List<dynamic> categories = [];
  @override
  void initState() {
    super.initState();
    fetchMainCategories();
  }
  Future<void> fetchMainCategories() async {
    final response = await http.get(
      Uri.parse('${Config.url}/products/categories?parent=${widget.subcategoryId}'),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(widget.categoryName),
      ),
      body: Container(
        color: Colors.white,
        margin:  EdgeInsets.all(Dimensions.radius15/2),
            height: MediaQuery.of(context).size.height ,
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                //mainAxisExtent: 300
                 ),
              itemBuilder: (_, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductListWidget(
                        categoryName: category['name'],
                        subcategoryId: (category['id'])
                    ));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return ProductListWidget(
                    //           categoryName: category['name'],
                    //           subcategoryId: (category['id'])
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                      border: Border.all(width: 1, color: Colors.grey.shade100),),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          category['image']['src'],
                          height: MediaQuery.of(context).size.height*0.18,
                          width: MediaQuery.of(context).size.height*0.2,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: Dimensions.height10),
                          child: Text(
                            category["name"],
                            style:  TextStyle(
                                fontSize: Dimensions.font16,
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
          ),
    );
  }
}
