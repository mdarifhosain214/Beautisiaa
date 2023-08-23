
import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'big_text.dart';
import 'small_text.dart';

class PopupProduct extends StatefulWidget {
  final String img;
  final String name;
  final String oldPrice;
  final String currentPrice;

  const PopupProduct(
      {Key? key,
      required this.img,
      required this.name,
      required this.oldPrice,
      required this.currentPrice})
      : super(key: key);

  @override
  State<PopupProduct> createState() => _PopupProductState();
}

class _PopupProductState extends State<PopupProduct>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ), //Expanded(child: SearchBar())
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 340,
            //color: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.name,style: const TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1,color:const Color(0xFF691883),)
                      ),
                      child:const Center(
                        child: Icon(Icons.remove,color: Color(0xFF691883)),
                      ) ,),
                      Container(
                        padding: const EdgeInsets.all(10),
                          child: const Text("2",style: TextStyle(color: AppColors.mainColor,fontWeight: FontWeight.w600,fontSize: 16),)),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color:const Color(0xFF691883),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child:const Center(
                          child: Icon(Icons.add,color: Colors.white,),
                        ) ,),],),

                    BigText(
                      text: '\$${widget.currentPrice}',
                      size: 18,
                      color: AppColors.mainColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallText(text: "Universal skin solve"),
                    Text(
                      '\$${widget.oldPrice}',
                      style: const TextStyle(
                          fontSize: 18, decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Color",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Expanded(child: Container())
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Sub Total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$234",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            //height: h * 0.07,
            height: 55,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            decoration: BoxDecoration(
                color: const Color(0xFF691883),
                borderRadius: BorderRadius.circular(8.0)),
            child: const Center(
              child: Text(
                "View cart",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            ),
          ),
          Container(
            //height: h * 0.07,
            height: 55,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: const Center(
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            ),
          )

//            const ListTile(
//             title: BigText(text: "Description",),
//             subtitle: ExpandableTextWidget(text: """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam sit amet nisl suscipit. Pretium lectus quam id leo in vitae turpis massa. Eget sit amet tellus cras adipiscing enim eu turpis. Tortor condimentum lacinia quis vel. Consectetur adipiscing elit ut aliquam purus. Amet cursus sit amet dictum sit amet. Lacinia quis vel eros donec ac. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget. Vitae turpis massa sed elementum. Turpis egestas pretium aenean pharetra magna ac placerat.
//
// Eu scelerisque felis imperdiet proin fermentum leo vel orci porta. Et molestie ac feugiat sed lectus. Id porta nibh venenatis cras sed felis eget velit aliquet. Vulputate odio ut enim blandit volutpat maecenas volutpat blandit. Condimentum vitae sapien pellentesque habitant morbi tristique. In tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Enim eu turpis egestas pretium aenean pharetra magna. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Nisl tincidunt eget nullam non nisi est sit. Pellentesque nec nam aliquam sem et tortor consequat id. Et tortor consequat id porta nibh venenatis cras. A cras semper auctor neque. Facilisi nullam vehicula ipsum a arcu cursus. Ornare arcu odio ut sem nulla pharetra diam. Odio ut sem nulla pharetra diam sit amet nisl suscipit. Pharetra magna ac placerat vestibulum.
//
// Turpis egestas sed tempus urna et pharetra pharetra massa massa. Dui nunc mattis enim ut tellus elementum sagittis. Enim praesent elementum facilisis leo vel fringilla est. A diam sollicitudin tempor id eu nisl nunc mi ipsum. Lorem donec massa sapien faucibus et. Egestas integer eget aliquet nibh praesent. Enim nunc faucibus a pellentesque sit amet porttitor eget. Pellentesque habitant morbi tristique senectus et. Massa massa ultricies mi quis hendrerit dolor magna eget est. Dui sapien eget mi proin. Natoque penatibus et magnis dis parturient montes nascetur ridiculus. Senectus et netus et malesuada. Phasellus egestas tellus rutrum tellus pellentesque. Ut sem nulla pharetra diam sit amet. Justo laoreet sit amet cursus sit amet dictum sit. Vitae aliquet nec ullamcorper sit amet risus nullam eget."""),
//
//           ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   //height: h * 0.07,
      //   height: 55,
      //   margin:
      //   const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      //   decoration: BoxDecoration(
      //       color: AppColors.mainColor,
      //       borderRadius: BorderRadius.circular(8.0)),
      //   child: const Center(
      //     child: Text(
      //       "Checkout",
      //       style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //           letterSpacing: 2),
      //     ),
      //   ),
      // ),
    ));
  }
}
