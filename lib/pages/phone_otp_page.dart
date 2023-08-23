import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class PhoneOtpPage extends StatefulWidget {
  const PhoneOtpPage({Key? key}) : super(key: key);

  @override
  State<PhoneOtpPage> createState() => _PhoneOtpPageState();
}

class _PhoneOtpPageState extends State<PhoneOtpPage> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.black,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 30,
                color: Color(0xFFDE0C77),
              ),
              const SizedBox(height: 250,),
              const Pinput(
                length: 6,

                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,

              ),
              const SizedBox(height: 50,),


              const Text("Code was sent your phone number",style: TextStyle(fontSize: 16,color: Colors.grey),),
              const Text("+8801687900356",style: TextStyle(fontSize: 16,color: Color(0xFFDE0C77)),),
              const SizedBox(height: 100,),
              RichText(text: const TextSpan(text: "This code will expire on",style: TextStyle(color: Colors.grey,fontSize: 16),
              children: [
                TextSpan(text: " 5 minutes",style: TextStyle(color: Color(0xFFDE0C77),fontWeight: FontWeight.w500,fontSize: 16))
              ])),
              const SizedBox(height: 80,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 55,
                  margin:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xFF691883),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "VERIFY CODE",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 55,
                  margin:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xFFDE0C77),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "RESEND CODE",
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
          ),
        ),
      ),
    );
  }
}
