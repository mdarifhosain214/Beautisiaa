import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'big_text.dart';
import 'succes_page.dart';
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int groupValue=1;
  void radioButtonMethod(value){
    setState(() {
      groupValue=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: const [
              SizedBox(
                width: 90,
              ),
              Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF691883),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: const [
            Icon(
              Icons.messenger_outline,
              color: Color(0xFF691883),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      body: ListView(
        children: [
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
              Text("Address",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
              Text("Change Address",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF691883)),),
            ],),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),
            child: const Text("House 18,Road 2 ,Block B,Section 6, Mirpur",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),),),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Payment Method",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                Text("Show All",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF691883)),),
              ],),
          ),
          SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                RadioListTile(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: radioButtonMethod,
                  title: const Text("Cash on delivery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: Icon(Icons.photo_camera_back),
                  activeColor: AppColors.mainColor,
                  selected:groupValue==1? true:false,
                ),
                RadioListTile(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: radioButtonMethod,
                  title: const Text("Bkash/Nagad/Rocket",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: const Icon(Icons.photo_camera_back),
                  activeColor: AppColors.mainColor,
                  selected:groupValue==2? true:false,
                ),
                RadioListTile(
                  value: 3,
                  groupValue: groupValue,
                  onChanged: radioButtonMethod,
                  secondary: const Icon(Icons.photo_camera_back),
                  title: const Text("Cart Method",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: AppColors.mainColor,
                  selected:groupValue==3? true:false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF6F6F7),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Use Promo for Discount",
                  prefixIcon: const Icon(Icons.star_outline_outlined,color: AppColors.mainColor,),
                suffixIcon: const Icon(Icons.arrow_forward_ios)
              ),

            ),
          ),
           const SizedBox(height: 100,),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFF691883)),
            child: Column(
              children: [
                Row(
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          BigText(
                            text: "Subtotal ( " + "3" + ")",
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "Total discount items ",
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "Price",
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                     Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 15, bottom: 20, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          BigText(
                            text: "\$ 36",
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "-\$6",
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "\$30",
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //Place order button
                ///=====================================
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SuccessPage()));
                  },
                  child: Container(
                    //height: h * 0.07,
                    height: 55,
                    margin:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Confirm Order",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF691883),
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
