import 'package:flutter/material.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //color: Colors.purple,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3 / 2,
                    width: MediaQuery.of(context).size.height * 0.3 / 2,
                    decoration: BoxDecoration(
                        //color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Kylie",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Kylie@gmail.com",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              //color: Colors.redAccent,
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person_pin,
                          size: 30,
                        ),
                        title: Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.location_on_outlined,
                          size: 30,
                        ),
                        title: Text(
                          'My Address',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.local_offer,
                          size: 30,
                        ),
                        title: Text(
                          'My Offer',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.view_list_outlined,
                          size: 30,
                        ),
                        title: Text(
                          'My Order',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),
                        title: Text(
                          'My Favourites',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.payment,
                          size: 30,
                        ),
                        title: Text(
                          'Payment',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
