import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_beautisaiaa_app/const/dimensions.dart';
import '../app_colors.dart';
import '../config/config.dart';
import '../pages/cart_page.dart';
import 'big_text.dart';
import 'expandable_text_widget.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import 'small_text.dart';
class ProductDetails extends StatefulWidget {
  final String productId;
  const ProductDetails(
      {Key? key, required this.productId,

      })
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}
class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  final PageController _pageController =PageController();
  late Future<Map<String, dynamic>> _productDetailsFuture;
  //List<String>items=['Description',"Why it's special","Review"];

  @override
  void initState() {
    super.initState();
    _productDetailsFuture = fetchProductDetails(widget.productId);
  }
  Future<Map<String, dynamic>> fetchProductDetails(String productId) async {
    final response = await http.get(
      Uri.parse('https://beautysiaa.com/wp-json/wc/v3/products/$productId'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('${Config.key}:${Config.secret}'))}',

      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> product = json.decode(response.body);
      return product;
    } else {
      throw Exception('Failed to fetch product details');
    }
  }
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            leading:IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          )  ,),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _productDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data!;
           // print(product);
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.79,
                  child: ListView(
                    shrinkWrap: true,
                   // physics: const NeverScrollableScrollPhysics(),
                    children: [
                       SizedBox(
                        height: Dimensions.height10/2,
                      ),
                      Container(
                        width: double.infinity,
                        height: Dimensions.height10*36,
                        margin:  EdgeInsets.only(left: Dimensions.width10/2, right: Dimensions.width10/2),
                        //color: Colors.black,
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                          child: Image.network(
                            product['images'][0]['src'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //height: 20,
                                //color: Colors.red,
                                width: MediaQuery.of(context).size.width*0.75,
                                child: Text("${product['name']}",style:  TextStyle(fontSize: Dimensions.font20),maxLines: 3,overflow: TextOverflow.ellipsis,),
                              ),
                              BigText(
                                text: '\$ ${product['price']}',
                                size: Dimensions.font20,
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),

                           SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SmallText(text: "Universal skin solve"),
                              Text('\$ ${product['regular_price']}',
                                style: const TextStyle(
                                    fontSize: 18, decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                           SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            children: [
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical: Dimensions.height10/2),
                                height: Dimensions.height10*6,
                                width: Dimensions.height10*6,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical: Dimensions.height10/2),
                                height: Dimensions.height10*6,
                                width: Dimensions.height10*6,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical: Dimensions.height10/2),
                                height: Dimensions.height10*6,
                                width: Dimensions.height10*6,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical: Dimensions.height10/2),
                                height: Dimensions.height10*6,
                                width: Dimensions.height10*6,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            ],
                          ),
                           SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            children: [
                               Text(
                                "Color",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: Dimensions.font20),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                           SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            children: [
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical:Dimensions.height10/2),
                                height: Dimensions.height10*3.5,
                                width: Dimensions.height10*3.5,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical:Dimensions.height10/2),
                                height: Dimensions.height10*3.5,
                                width: Dimensions.height10*3.5,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical:Dimensions.height10/2),
                                height: Dimensions.height10*3.5,
                                width: Dimensions.height10*3.5,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical:Dimensions.height10/2),
                                height: Dimensions.height10*3.5,
                                width: Dimensions.height10*3.5,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical:Dimensions.height10/2),
                                height: Dimensions.height10*3.5,
                                width: Dimensions.height10*3.5,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                              ),
                              Container(
                                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical:Dimensions.height10/2),
                                height: Dimensions.height10*3.5,
                                width: Dimensions.height10*3.5,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                       SizedBox(
                        height: Dimensions.height10*27,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5,right: 5),
                              child: TabBar(
                                labelColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                controller: tabController,
                                tabs: const [
                                  Tab(text: "Description",),
                                  Tab(text: "Why it's special",),
                                  Tab(text: "Review",),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: double.infinity,
                                // height: 350,
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    ListView(
                                      children: [
                                        ExpandableTextWidget(text:product['description']),
                                      ],
                                    ),
                                    ListView(
                                      children: [
                                        ExpandableTextWidget(text:product['description']),
                                      ],
                                    ),
                                    Text(product['description']),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )



                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(CartPage(product: snapshot.data!));
                    // Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => CartPage(product: snapshot.data!),),);
                  },
                  child: Container(
                    //height: h * 0.07,
                    height: MediaQuery.of(context).size.height*0.08,
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: const Color(0xFF691883),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return const Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
        },
      ),
      
      // bottomNavigationBar: GestureDetector(
      //   onTap: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => PopupProduct(
      //                   img: widget.products['description'],
      //                   name: widget.name,
      //                   oldPrice: widget.oldPrice,
      //                   currentPrice: widget.currentPrice,
      //                 ),),);
      //   },
      //   child: Container(
      //     //height: h * 0.07,
      //     height: 55,
      //     margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      //     decoration: BoxDecoration(
      //         color: const Color(0xFF691883),
      //         borderRadius: BorderRadius.circular(8.0)),
      //     child: const Center(
      //       child: Text(
      //         "Add to cart",
      //         style: TextStyle(
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.white,
      //             letterSpacing: 2),
      //       ),
      //     ),
      //   ),
      // ),
    ));
  }
}
