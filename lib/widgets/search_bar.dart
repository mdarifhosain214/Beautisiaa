import 'package:flutter/material.dart';

import '../app_colors.dart';
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height:size.height*0.06,
      height: 50,

      width:double.infinity-50,
      decoration: BoxDecoration(
         color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(3.0),
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
}

Widget searchBar(){
  return Container(
    //height:size.height*0.06,
    height: 50,

    width:double.infinity-50,
    decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(3.0),
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
