
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../utilities/big_text.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h * 0.05,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                height: 100,
              ),

              // Beautysiaa text
              const BigText(
                text: "BEAUTYSIAA",
                size: 35,
                color: AppColors.mainColor,
              ),

              // A symbol of beauty text
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
                  const Text(
                    " A Symbol of Beauty",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),

              //Name text field
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
                      hintText: "Enter User Name",
                      prefixIcon: const Icon(Icons.person)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //Phone number text field
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
                      hintText: "Enter phone number",
                      prefixIcon: const Icon(Icons.phone)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // Email address text field
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

              //Pass word text field
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
                height: 70,
              ),


              //Sign up button
              Container(
                //height: h * 0.07,
                height: 55,
                margin:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                decoration: BoxDecoration(
                    color: const Color(0xFF691883),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                ),
              ),

              //page route text button
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const Text("If have an account? ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            letterSpacing: 1)),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>LoginPage()));
                      },
                      child: const Text(
                        " Login ",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                            letterSpacing: 1),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
