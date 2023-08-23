import 'dart:convert';

import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../config/config.dart';
import '../../pages/home_page.dart';
import 'package:http/http.dart'as http;
import '../../utilities/data.dart';
import '../sub_category_products_of_main_page/sub_category_products_main_page.dart';
class CategoryOfSkinCare extends StatefulWidget {
  final String mainCategoryName;
  const CategoryOfSkinCare({Key? key, required this.mainCategoryName}) : super(key: key);
  @override
  State<CategoryOfSkinCare> createState() => _CategoryOfSkinCareState();
}
class _CategoryOfSkinCareState extends State<CategoryOfSkinCare> {
  final PageController _pageController =PageController();
  Widget searchBar() {
    return Container(
      //height:size.height*0.06,
      height: 50,
      width: double.infinity - 50,
      decoration: BoxDecoration(
        // color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 2, color: AppColors.mainColor)),
      margin: const EdgeInsets.all(15),
      //width: 200,
      child: Center(
        child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: false,
            //fillColor: AppColors.mainColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black54,
            ),
            hintText: "Search Products",
            hintStyle: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
  @override
  List<int>pageId=[80,73,56,105,109,91];
  // List<dynamic> _products = [];
  // List<dynamic> _products1 = [];
  // List<dynamic> _products2 = [];
  // List<dynamic> _products3 = [];
  // List<dynamic> _products4 = [];
  // List<dynamic> _products5 = [];
  List<dynamic> categories = [];
  // bool _isLoading = false;
  // bool _isLoading1 = false;
  // bool _isLoading2 = false;
  // bool _isLoading3 = false;
  // bool _isLoading4 = false;
  // bool _isLoading5 = false;

  @override
  void initState() {
    super.initState();
    //getBodyCareAllProduct();
    getSkinCareCategories();
    // getEyeCareAllProduct();
    // getFaceCareAllProduct();
    // getKBCareAllProduct();
    // getSkinConcernAllProduct();
    // getSkinIntAllProduct();
  }
  Future<void> getSkinCareCategories() async {
    // List<dynamic> categories = [];
    final response = await http.get(
      Uri.parse('${Config.url}/products/categories?parent=51'),
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
  // Future<void> getBodyCareAllProduct() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   const url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=80';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _products = jsonDecode(response.body);
  //       _isLoading = false;
  //     });
  //   } else {
  //     // Handle API error
  //     print('Failed to fetch products. Error: ${response.statusCode}');
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
  // Future<void> getEyeCareAllProduct() async {
  //   setState(() {
  //     _isLoading1 = true;
  //   });
  //
  //   const url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=73';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _products1 = jsonDecode(response.body);
  //       _isLoading1 = false;
  //     });
  //   } else {
  //     // Handle API error
  //     print('Failed to fetch products. Error: ${response.statusCode}');
  //     setState(() {
  //       _isLoading1 = false;
  //     });
  //   }
  // }
  // Future<void> getFaceCareAllProduct() async {
  //   setState(() {
  //     _isLoading2 = true;
  //   });
  //
  //   const url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=56';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _products2 = jsonDecode(response.body);
  //       _isLoading2 = false;
  //     });
  //   } else {
  //     // Handle API error
  //     print('Failed to fetch products. Error: ${response.statusCode}');
  //     setState(() {
  //       _isLoading2 = false;
  //     });
  //   }
  // }
  // Future<void> getKBCareAllProduct() async {
  //   setState(() {
  //     _isLoading3 = true;
  //   });
  //
  //   const url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=105';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _products3 = jsonDecode(response.body);
  //       _isLoading3 = false;
  //     });
  //   } else {
  //     // Handle API error
  //     print('Failed to fetch products. Error: ${response.statusCode}');
  //     setState(() {
  //       _isLoading3 = false;
  //     });
  //   }
  // }
  // Future<void> getSkinConcernAllProduct() async {
  //   setState(() {
  //     _isLoading4 = true;
  //   });
  //
  //   const url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=109';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _products4 = jsonDecode(response.body);
  //       _isLoading4 = false;
  //     });
  //   } else {
  //     // Handle API error
  //     print('Failed to fetch products. Error: ${response.statusCode}');
  //     setState(() {
  //       _isLoading4 = false;
  //     });
  //   }
  // }
  // Future<void> getSkinIntAllProduct() async {
  //   setState(() {
  //     _isLoading5 = true;
  //   });
  //
  //   const url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=91';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _products5 = jsonDecode(response.body);
  //       _isLoading5 = false;
  //     });
  //   } else {
  //     // Handle API error
  //     print('Failed to fetch products. Error: ${response.statusCode}');
  //     setState(() {
  //       _isLoading5 = false;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(widget.mainCategoryName,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: "Montserrat"),),
      ),
      body: Column(
        children: [
          //===========================search bar============================
          searchBar(),
          //===========================sub category of skn care=====================
          Container(
            height:MediaQuery.of(context).size.width*0.22,
          //color: Colors.black,
          margin: const EdgeInsets.only(left: 8,bottom: 10,right: 20),
          child: ListView.builder(
            itemCount:categories.length,
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
              final category =categories[index];
            return GestureDetector(
              onTap: (){
                _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Container(
                height:MediaQuery.of(context).size.width*0.25,
                width: MediaQuery.of(context).size.width*0.25,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.only(bottom:3,top: 5),
                decoration:  BoxDecoration(
                  //color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey,width: 1)
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   // Icon(Icons.ice_skating,size: 40,),
                    Container(
                      height:MediaQuery.of(context).size.width*0.25-40 ,
                      width: MediaQuery.of(context).size.width*0.25-25,
                      decoration:BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(category['image']['src'])
                        )
                      ) ,),
                    //Image.network(category['image']['src'],height: 40,width: double.infinity,fit: BoxFit.cover,),
                    Text(category['name'],style: const TextStyle(fontSize: 14),maxLines: 1,)
                  ],
                ),
              ),
            );
          }),),
          //==================product show of sub category of skn care=================
          SizedBox(
            //color: Colors.red,
            //height: MediaQuery.of(context).size.height*0.6735,
            height: MediaQuery.of(context).size.height*0.663,

            child: PageView(
               controller: _pageController,
              scrollDirection: Axis.horizontal,
              children:List.generate(pageId.length, (index) =>SubCategoryProductMainPage(subcategoryId:pageId[index].toString()))
              // [
              //  //====================body care product================
              //   Container(
              //     height:MediaQuery.of(context).size.height*0.6735,
              //     margin: const EdgeInsets.all(8),
              //     // color: Colors.black,
              //     child: GridView.builder(
              //         itemCount: _products.length,
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 8,
              //         mainAxisSpacing: 8,
              //         mainAxisExtent: 350
              //     ), itemBuilder: (context,index){
              //       final product = _products[index];
              //       print(product);
              //       var img;
              //       for(Map n in product['images'])
              //       {
              //         img =n['src'];
              //       }
              //       return  CardForHome(
              //         imgUrl:img,
              //         productName:product['name'],
              //         oldPrice: double.parse(product['regular_price']),
              //         currentPrice: double.parse(product['price']),
              //       );
              //     }),
              //   ),
              //  //====================eye care product=================
              //   Container(
              //     height:MediaQuery.of(context).size.height*0.6735,
              //     margin: const EdgeInsets.all(8),
              //     // color: Colors.black,
              //     child: GridView.builder(
              //         itemCount: _products1.length,
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 8,
              //             mainAxisSpacing: 8,
              //             mainAxisExtent: 350
              //         ), itemBuilder: (context,index){
              //       final product = _products1[index];
              //       print(product);
              //       var img;
              //       for(Map n in product['images'])
              //       {
              //         img =n['src'];
              //       }
              //       return  CardForHome(
              //         imgUrl:img,
              //         productName:product['name'],
              //         oldPrice: double.parse(product['regular_price']),
              //         currentPrice: double.parse(product['price']),
              //       );
              //     }),
              //   ),
              //   //===================face care product===============
              //   Container(
              //     height:MediaQuery.of(context).size.height*0.6735,
              //     margin: const EdgeInsets.all(8),
              //     // color: Colors.black,
              //     child: GridView.builder(
              //         itemCount: _products2.length,
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 8,
              //             mainAxisSpacing: 8,
              //             mainAxisExtent: 350
              //         ), itemBuilder: (context,index){
              //       final product = _products2[index];
              //       print(product);
              //       var img;
              //       for(Map n in product['images'])
              //       {
              //         img =n['src'];
              //       }
              //       return  CardForHome(
              //         imgUrl:img,
              //         productName:product['name'],
              //         oldPrice:product['regular_price']!=null? double.parse(product['regular_price']):0.0,
              //         currentPrice: product['price']!=null? double.parse(product['price']):0.0,
              //       );
              //     }),
              //   ),
              //   //==================k-beauty product================
              //   Container(
              //     height:MediaQuery.of(context).size.height*0.6735,
              //     margin: const EdgeInsets.all(8),
              //     // color: Colors.black,
              //     child: GridView.builder(
              //         itemCount: _products3.length,
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 8,
              //             mainAxisSpacing: 8,
              //             mainAxisExtent: 350
              //         ), itemBuilder: (context,index){
              //       final product = _products3[index];
              //       print(product);
              //       var img;
              //       for(Map n in product['images'])
              //       {
              //         img =n['src'];
              //       }
              //       return  CardForHome(
              //         imgUrl:img,
              //         productName:product['name'],
              //         oldPrice:product['regular_price']!=null? double.parse(product['regular_price']):0.0,
              //         currentPrice: product['price']!=null? double.parse(product['price']):0.0,
              //       );
              //     }),
              //   ),
              //   //=================skin concern======================
              //   Container(
              //     height:MediaQuery.of(context).size.height*0.6735,
              //     margin: const EdgeInsets.all(8),
              //     // color: Colors.black,
              //     child: GridView.builder(
              //         itemCount: _products4.length,
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 8,
              //             mainAxisSpacing: 8,
              //             mainAxisExtent: 350
              //         ), itemBuilder: (context,index){
              //       final product = _products4[index];
              //       print(product);
              //       var img;
              //       for(Map n in product['images'])
              //       {
              //         img =n['src'];
              //       }
              //       return  CardForHome(
              //         imgUrl:img,
              //         productName:product['name'],
              //         oldPrice:product['regular_price']!=null? double.parse(product['regular_price']):0.0,
              //         currentPrice: product['price']!=null? double.parse(product['price']):0.0,
              //       );
              //     }),
              //   ),
              //   //================skin int============
              //   Container(
              //     height:MediaQuery.of(context).size.height*0.6735,
              //     margin: const EdgeInsets.all(8),
              //     // color: Colors.black,
              //     child: GridView.builder(
              //         itemCount: _products5.length,
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 8,
              //             mainAxisSpacing: 8,
              //             mainAxisExtent: 350
              //         ), itemBuilder: (context,index){
              //       final product = _products5[index];
              //       print(product);
              //       var img;
              //       for(Map n in product['images'])
              //       {
              //         img =n['src'];
              //       }
              //       return  CardForHome(
              //         imgUrl:img,
              //         productName:product['name'],
              //         oldPrice:product['regular_price']!=null? double.parse(product['regular_price']):0.0,
              //         currentPrice: product['price']!=null? double.parse(product['price']):0.0,
              //       );
              //     }),
              //   ),
              //
              //
              //
              // ],
            ),
          ),

        ],
      ),
    );
  }
}
