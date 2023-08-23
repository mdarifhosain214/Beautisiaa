import 'package:flutter/material.dart';
import '../api_service/api_service.dart';
import '../app_colors.dart';
import '../const/dimensions.dart';
import '../utilities/app_banner_view.dart';
import '../utilities/big_text.dart';
import '../utilities/data.dart';
import '../utilities/product_card.dart';
import '../widgets/best_salling_products.dart';
import '../widgets/flash_sale.dart';
import '../widgets/mega_sale_products.dart';
import '../widgets/hot_deals.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  ApiService apiService =ApiService();

  @override
  void initState() {
    super.initState();
    apiService =ApiService();
  }
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size.width;
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Beautysiaa"),
              accountEmail: Text("beautysiaa@gmail.com"),
              decoration: BoxDecoration(color: AppColors.mainColor),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "B",
                    style: TextStyle(color: AppColors.mainColor, fontSize: 30),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Account"),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text("Cart"),
            ),
            ListTile(
              leading: Icon(Icons.local_offer_outlined),
              title: Text("Offer"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Person"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.abc_outlined),
              title: Text("About"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.mainColor,
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title:  Text(
          "BEAUATYSIAA",
          style: TextStyle(fontSize: Dimensions.font26, letterSpacing: 2),
        ),

        actions:  [
          Icon(
            Icons.notifications_active_outlined,
            size: Dimensions.height30,
          ),
          SizedBox(
            width: Dimensions.width15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //=============================search bar=======================================
            searchBar(),
            //const SearchBar(),
            // ============================app banner=======================================
            const AppBannerView(),
             SizedBox(
              height: Dimensions.height10,
            ),
            //==============================Hot deals=======================================
            Container(
              margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hot Deals".toUpperCase(),
                    style: style,),
                ],
              ),
            ),

            Container(
              height: Dimensions.height10*38,
              margin:  EdgeInsets.only(left: Dimensions.width10/2, right: Dimensions.width10/2),
              child:  const HotDeals(),
            ),


            //  ===============================shop by Category ======================================
            Container(
              margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10,top: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Shop By Category".toUpperCase(),
                    style: style,
                  ),
                ],
              ),
            ),
             SizedBox(
              height: Dimensions.height10,
            ),

            Container(
                margin:  EdgeInsets.only(
                    left: Dimensions.width15, right:Dimensions.width15 , bottom: Dimensions.height15/2, top: Dimensions.height15/2),
                // color: Colors.grey.shade100,
                height: Dimensions.height20*10,
                width: double.infinity,
                child: GridView.builder(

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount:shopByCategories.length ,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(shopByCategoryList[index]);

                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>shopByCategoryList[index]));
                        },
                        child: Container(

                          //padding: const EdgeInsets.all(5.0),
                          //margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF470360),
                              borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                              border:
                              Border.all(color: Colors.black, width: 1)),

                          child:  Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Center(
                                    child: Image.asset(shopByCategoriesImages[index],height: Dimensions.height45,width: Dimensions.height20*2,fit: BoxFit.cover,)
                                ),
                                Text(
                                  shopByCategories[index],
                                  style:  const TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.w600, letterSpacing: 1,),maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })

            ),

            //===============================flash sale========================================
            Container(
              height: Dimensions.height20*22.4,
              margin:  EdgeInsets.only(left: Dimensions.width15/2, top: Dimensions.height15/2),
              padding:  EdgeInsets.only(left: Dimensions.width10, bottom: Dimensions.height10),
              decoration:  BoxDecoration(
                  color: const Color(0xfff9f9f9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15/2),
                      bottomLeft: Radius.circular(Dimensions.radius15/2))),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                        left: Dimensions.width15/2, right: Dimensions.width15, top: Dimensions.height15, bottom: Dimensions.height15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Flash sale", style: style,
                        ),
                        GestureDetector(
                            onTap: () {
                              //print("Tapped");
                            },
                            child: const BigText(
                              text: "See More",
                              color: AppColors.mainColor,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    // margin: EdgeInsets.only(left: 8),
                    height: Dimensions.height10*37,
                    child:const FlashSale(subcategoryId: '620 '),
                  ),
                ],
              ),
            ),


            //===============================super offer=====================================
            Container(
              margin:  EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10, top: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Super offer".toUpperCase(),
                    style: style,
                  ),
                ],
              ),
            ),
            Container(
              margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              height: Dimensions.height20*22.4,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      height: Dimensions.height10*10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                      ),
                    );
                  }),
            ),

            //============================== Mega Sale========================================
            Padding(
              padding:  EdgeInsets.all(Dimensions.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Mega Sale",style: style,),
                  GestureDetector(
                      onTap: () {
                        //print("Tapped");
                      },
                      child: const BigText(
                        text: "See More",
                        color: AppColors.mainColor,
                      )),
                ],
              ),
            ),
            Container(
                margin:  EdgeInsets.only(left: Dimensions.width15),
                height: Dimensions.height10*37,
                child: const MegaSaleProducts()
            ),
            //==============================best sale========================================

            Container(
              height:Dimensions.height20*22.4,
              margin:  EdgeInsets.only(left: Dimensions.width15/2, top: Dimensions.height15/2),
              padding:  EdgeInsets.only(left: Dimensions.width10, bottom: Dimensions.height10),
              decoration: const BoxDecoration(
                  color: Color(0xfff9f9f9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                        left: Dimensions.width15/2, right: Dimensions.width15, top: Dimensions.height15, bottom: Dimensions.height15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Best sale", style: style,
                        ),
                        GestureDetector(
                            onTap: () {
                              //print("Tapped");
                            },
                            child: const BigText(
                              text: "See More",
                              color: AppColors.mainColor,
                            )),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: Dimensions.height10*37,
                    child: const BestSallingProducts(),
                  ),
                ],
              ),
            ),
            //=============================recommended product banner=========================
            Container(
              height: Dimensions.height20*11,
              width: double.infinity,
              margin:  EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(Dimensions.radius15/2)),
            ),
            //============================shop by concern===================================
            Container  (
              margin:  EdgeInsets.only(
                  left: Dimensions.width15/2, right: Dimensions.width15, bottom: Dimensions.height10, top: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Shop By concern".toUpperCase(),
                    style: style,
                  ),
                ],
              ),
            ),
            Container(
              margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              height: Dimensions.height20*40,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  }),
            ),

            //=============================recommended products==============================
            Container(
              height: 1410,
              margin: const EdgeInsets.all(5),
              //color: Colors.red,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 350),
                  itemBuilder: (context, index) {
                    return const CardForHome(
                      imgUrl:
                      "https://beautysiaa.com/wp-content/uploads/2023/01/pax-moly-niacinamide-5-hyaluronic-acid-5-ac-serum-300x300.jpg",
                      productName: "Pax Moly Niacinamide 5% Hyaluronic Acid 5% AC Serum 50ml",
                      oldPrice: '1259',
                      currentPrice: '950',
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
// class CardDemo extends StatefulWidget {
//   const CardDemo({Key? key}) : super(key: key);
//
//   @override
//   State<CardDemo> createState() => _CardDemoState();
// }
// class _CardDemoState extends State<CardDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //margin: const EdgeInsets.only(left: 8,right: 8),
//       height: Dimensions.height10*34,
//       width: 200,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           //color: Colors.deepOrange,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(width: 1, color: const Color(0xFFD9D9D9),),
//           boxShadow: const[
//             BoxShadow(color: Color(0xffe8e8e8),
//               blurRadius: 5,
//               offset: Offset(0,5),),
//             BoxShadow(
//               color: Colors.white,
//               offset: Offset(-5,0),),
//             BoxShadow(
//               color: Colors.white,
//               offset: Offset(5,0),),
//           ]
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 180,
//             width: 180,
//             margin: const EdgeInsets.all(5),
//             // padding: EdgeInsets.all(10),
//             decoration: const BoxDecoration(
//               // border: Border.all(color: Colors.grey,width: 1),
//               image: DecorationImage(fit: BoxFit.cover,
//                   image: NetworkImage("https://beautysiaa.com/wp-content/uploads/2023/01/pax-moly-niacinamide-5-hyaluronic-acid-5-ac-serum-300x300.jpg",)
//
//               ),
//             ),
//
//           ),
//           Container(
//             height: 150,
//             padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
//             // decoration: BoxDecoration(
//             //   border: Border.all(color: Colors.red,width: 1)
//             // ),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Pax Moly Niacinamide 5% Hyaluronic Acid 5% AC Serum 50ml",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: "Montserrat",
//                         letterSpacing: 1),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Wrap(
//                     children: List.generate(5, (index) {
//                       return Icon(
//                         Icons.star,
//                         color: Colors.yellow.shade600,
//                         size: 24,
//                       );
//                     }),
//                   ),
//                   const Text(
//                     "\$8998",
//                     style: TextStyle(
//                         fontSize: 14, decoration: TextDecoration.lineThrough),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "\$8998",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "Montserrat",
//                             color: AppColors.mainColor,
//                             letterSpacing: 1
//                         ),
//                       ),
//                       Container(
//                         height: 30,
//                         width: 30,
//                         // padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             color: const Color(0xFF691883),
//                             borderRadius: BorderRadius.circular(50)),
//                         child: const Center(
//                           child: Icon(
//                             Icons.shopping_cart_outlined,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<ProductData>item=[
    //   ProductData(
    //       img: "https://punicamakeup.com/wp-content/uploads/2017/02/Tata-Harper-Cosmetics.jpg",
    //       name: "Product Name",
    //       //oldPrice: 234, currentPrice: 220
    //       )
    // ];
    return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 310),
        itemBuilder: (BuildContext context, int index) {
          return const ProductCard(
            img: "",
            name: "product name", oldPrice: 00, currentPrice: 00,
            //oldPrice: item[index].oldPrice,
            //currentPrice: item[index].currentPrice,
          );
        });
  }
}

class CardForHome extends StatelessWidget {
  final String imgUrl;
  final String productName;
  final String oldPrice;
  final String currentPrice;

  const CardForHome(
      {Key? key,
        required this.imgUrl,
        required this.productName,
        required this.oldPrice,
        required this.currentPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10*35,
      width: Dimensions.height10*21,
      decoration: BoxDecoration(
        color: Colors.white,
        //color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(Dimensions.radius15/2),
        border: Border.all(width: 1, color: const Color(0xFFD9D9D9),),
        // boxShadow: const[
        //   BoxShadow(color: Color(0xffe8e8e8),
        //     blurRadius: 5,
        //     offset: Offset(0,5),),
        //   BoxShadow(
        //     color: Colors.white,
        //     offset: Offset(-5,0),),
        //   BoxShadow(
        //     color: Colors.white,
        //     offset: Offset(5,0),),
        // ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Dimensions.height10*19,
            width: Dimensions.height10*19,
            margin:  EdgeInsets.all(Dimensions.height10/2),
            // padding: EdgeInsets.all(10),
            decoration:  BoxDecoration(
              // border: Border.all(color: Colors.grey,width: 1),
              image: DecorationImage(fit: BoxFit.cover,
                  image: NetworkImage(imgUrl)

              ),
            ),

          ),
          Container(
            height: Dimensions.height10*16.5,
            padding:  EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width15,bottom: Dimensions.height10),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.red,width: 1)
            // ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style:  TextStyle(
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        letterSpacing: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Wrap(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: Colors.yellow.shade600,
                        size: Dimensions.iconSize24,
                      );
                    }),
                  ),
                  Text(
                    "\$$oldPrice",
                    style:  TextStyle(
                        fontSize: Dimensions.font16, decoration: TextDecoration.lineThrough),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$currentPrice",
                        style:  TextStyle(
                            fontSize:Dimensions.font20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: AppColors.mainColor,
                            letterSpacing: 1
                        ),
                      ),
                      Container(
                        height: Dimensions.height20*2,
                        width: Dimensions.height20*2,
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF691883),
                            borderRadius: BorderRadius.circular(Dimensions.radius30*2)),
                        child:  Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: Dimensions.iconSize24,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class Category extends StatelessWidget {
//   final String imgUrl;
//   final String title;
//
//   const Category({Key? key, required this.imgUrl, required this.title})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 100,
//       padding: const EdgeInsets.all(8.0),
//       margin: const EdgeInsets.all(2.0),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(color: Colors.grey.shade900, width: 1)),
//       child: Column(
//         children: [
//           Image.network(
//             imgUrl,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: 70,
//           ),
//         ],
//       ),
//     );
//   }
//
// }
const style =TextStyle(fontSize:20,fontFamily: "Montserrat",fontWeight: FontWeight.w700,letterSpacing: 1.5 );
// ListTile(
// title: ClipRRect(
// // borderRadius: BorderRadius.circular(8.0),
// child: Image.network(
// imgUrl,
// fit: BoxFit.cover,
// width: double.infinity,
// height: 70,
// ),
// ),
// subtitle:
// Container(alignment: Alignment.topCenter, child: Text(title)),
// )
