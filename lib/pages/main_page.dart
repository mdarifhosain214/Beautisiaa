import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'dash_board.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'offer_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex =0;
  final List<Widget>_tabs=[
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const OfferPage(),
    const DashBoard()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor:const Color(0xFF9098B1),
        currentIndex: _selectedIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dataset_outlined),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: "Offer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        onTap: (index){
          setState((){
            _selectedIndex =index;
          });
        },
      ),


    );
  }
}
