
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../app_banner.dart';
class AppBannerView extends StatefulWidget {
  const AppBannerView({Key? key}) : super(key: key);

  @override
  State<AppBannerView> createState() => _AppBannerViewState();
}

class _AppBannerViewState extends State<AppBannerView> {
  List<Widget>img(){
    return appBannerList.map((e) => ClipRRect(
      child: Image.network(e,fit: BoxFit.cover,),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.maxFinite,
      child: CarouselSlider(
        items:img(),
       options: CarouselOptions(
         height: 400,
         aspectRatio: 16/9,
         //viewportFraction: 0.8,
         initialPage: 0,
         enableInfiniteScroll: true,
         reverse: false,
         autoPlay: true,
         autoPlayInterval: const Duration(seconds: 2),
         autoPlayAnimationDuration: const Duration(milliseconds: 2000),
         //autoPlayCurve: Curves.fastOutSlowIn,
         enlargeCenterPage: true,
         //enlargeFactor: 0.3,
        // onPageChanged: callbackFunction,
         scrollDirection: Axis.horizontal,
       ),
        //dotSpacing: 10.0,
      ),
    );
  }
}
