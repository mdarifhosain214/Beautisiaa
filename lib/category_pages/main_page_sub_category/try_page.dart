// import 'dart:convert';
// import 'package:beautysiaa_app/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../config/config.dart';
// import '../../pages/home_page.dart';
// import '../../utilities/product_details.dart';
// class ProductListWidget extends StatefulWidget {
//   final int subcategoryId;
//   final String categoryName;
//   const ProductListWidget({super.key, required this.subcategoryId, required this.categoryName});
//
//   @override
//   _ProductListWidgetState createState() => _ProductListWidgetState();
// }
//
// class _ProductListWidgetState extends State<ProductListWidget> {
//   Widget searchBar(){
//     return Container(
//       //height:size.height*0.06,
//       height: 50,
//
//       width:double.infinity,
//       decoration: BoxDecoration(
//         // color: AppColors.mainColor,
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(width: 2, color: AppColors.mainColor)),
//       margin: const EdgeInsets.all(10),
//       //width: 200,
//       child: Center(
//         child: TextField(
//           style: const TextStyle(color: Colors.black),
//           decoration: InputDecoration(
//             filled: false,
//             //fillColor: AppColors.mainColor,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(3),
//                 borderSide: BorderSide.none),
//             prefixIcon: const Icon(
//               Icons.search,
//               color: Colors.black54,
//             ),
//             hintText: "Search Products",
//             hintStyle: const TextStyle(color: Colors.black54),
//           ),
//         ),
//       ),
//     );
//   }
//   List<dynamic> _products = [];
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getSubcategoryAllProduct();
//   }
//   Future<void> getSubcategoryAllProduct() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     final url = 'https://beautysiaa.com/wp-json/wc/v3/products?category=${widget.subcategoryId}';
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'Authorization': 'Basic ' + base64Encode(utf8.encode('${Config.key}:${Config.secret}')),
//       },
//     );
//
//     if (response.statusCode == 200) {
//       setState(() {
//         _products = jsonDecode(response.body);
//         _isLoading = false;
//       });
//     } else {
//       // Handle API error
//       print('Failed to fetch products. Error: ${response.statusCode}');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//         centerTitle: true,
//         title: Text(widget.categoryName),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(0),
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               searchBar(),
//               Container(
//                 margin: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
//                 height: MediaQuery.of(context).size.height*0.8,
//                 child: _isLoading
//                     ? const Center(child: CircularProgressIndicator()):
//                 GridView.builder(
//                  // physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _products.length,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                         mainAxisExtent: 350
//                     ), itemBuilder: (context,index){
//                   final product = _products[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProductDetails(
//                             productId: product['id'].toString(),
//                           ),),
//                       );
//                     },
//                     child: CardForHome(
//                       imgUrl:product['images'][0]['src'],
//                       productName:product['name'],
//                       oldPrice: double.parse(product['regular_price']),
//                       currentPrice: double.parse(product['price']),
//                     ),
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//       //     : ListView.builder(
//       //   itemCount: _products.length,
//       //   itemBuilder: (context, index) {
//       //     final product = _products[index];
//       //     print(product);
//       //     var img;
//       //     for(Map n in product['images'])
//       //     {
//       //       img =n['src'];
//       //     }
//       //     return ListTile(
//       //
//       //       title: Container(
//       //         margin: const EdgeInsets.all(10),
//       //         height: 200,
//       //         width: 200,
//       //         decoration: BoxDecoration(
//       //             image: DecorationImage(
//       //                 fit: BoxFit.cover,
//       //                 image: NetworkImage(img)
//       //             )
//       //         ),
//       //       ),
//       //       subtitle: Column(
//       //         children: [
//       //
//       //           Text(product['name']),
//       //           Text(product['regular_price']),
//       //           Text(product['price']),
//       //         ],
//       //       ),
//       //     );
//       //   },
//       // ),
//     );
//   }
// }
