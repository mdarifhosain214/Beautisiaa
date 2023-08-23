import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../utilities/big_text.dart';
import 'phone_otp_page.dart';
import 'sign_up_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.02,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                height: 50,
              ),
              const BigText(
                text: "BEAUTYSIAA",
                size: 30,
                color: AppColors.mainColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1.5,
                        width: 80,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const Text(" A Symbol of Beauty")
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Sign In with A phone number",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              //Login with phone number text field
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
                      hintText: "Enter phone number",
                      prefixIcon: const Icon(Icons.phone)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //Code generate button
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ( builder)=>const PhoneOtpPage()));
                },
                child: Container(
                  height: 55,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xFF691883),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Code Generate",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              // OR text
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        margin: const EdgeInsets.only(right: 10),
                        height: 1.5,
                      ),
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        margin: const EdgeInsets.only(left: 10),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // Email and password text field
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
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
                      hintText: "Enter Email Address",
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: const Color(0xFF1C1B1F)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  obscureText: true,
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
                      hintText: "Enter password",
                      prefixIcon: const Icon(Icons.lock_outlined)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
               // height: h * 0.07,
                height: 55,
                margin:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                decoration: BoxDecoration(
                    color: const Color(0xFF691883),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                ),
              ),
               Container(
                 margin: const EdgeInsets.only(right: 40),
                 child: Row(
                   children: [
                     Expanded(child: Container()),
                     GestureDetector(
                       onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (builder)=>const SignUpPage()));
                     },
                       child: const Text("Create new one",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.mainColor,letterSpacing: 1),
              ),
                     ),
                     Expanded(child: Container()),
                   ],
                 ),
               ),
              const SizedBox(height: 15,),

              //OR Content
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        margin: const EdgeInsets.only(right: 10),
                        height: 1.5,
                      ),
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        margin: const EdgeInsets.only(left: 10),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //Login with Facebook
              Container(
                //width: w-20,
               // height: h * 0.07,
                height: 50,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF1877F2),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:  const [
                      SizedBox(
                       // margin: EdgeInsets.only(bottom: 5),
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      //Image.asset("assets/images/fb.jpg",height: 70,width:  70,),
                      Text(
                        "Continue with Facebook",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
