
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../pages/main_page.dart';
class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height/2,
        ),
        Container(
         // height: MediaQuery.of(context).size.height*0.92-MediaQuery.of(context).size.height/3,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10,right: 10),
          decoration:BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Column(children: [
            Container(
              height: 5,
              width: 50,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(2.5)
            ),
           ),
            const SizedBox(height: 20,),
            Container(
              height: 60,
              width: 60,
            margin: const EdgeInsets.only(top: 20),

            decoration: BoxDecoration(
                color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(30)
            ),
              child: const Icon(Icons.check,color: Colors.white,size: 50,),
           ),
            const SizedBox(height: 20,),

            const Text("Success",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.mainColor),),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 30,right: 30),
              height: 150,
              //color: Colors.yellow,
            child: const Center(child: Text("Thank you for Purchasing. Your order will be shipped 2-4 working days",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),),),
            GestureDetector(
              onTap: (){
                Get.to(const MainPage());
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainPage()));
              },
              child: Container(
                //height: h * 0.07,
                height: 55,
                margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                decoration: BoxDecoration(
                    color: const Color(0xFF691883),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Center(
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                ),
              ),
            )
          ],),


        )
      ],
    ));
  }
}
