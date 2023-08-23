import 'package:flutter/cupertino.dart';

import '../category_pages/sub_category_products_of_category_page/product_list.dart';

List<String>mainCategory=[
  "Skin Care",
  "Makeup",
  "Hair",
  "Men",
  "Mom & Baby",
  "Offer",
  "Brands",
];

List<String>skinCare=[
  "Face Care",
  "Eye Care",
  "Body Care",
  "Skincare Ingredients",
  "Skin Concern",
];
List<String>makeup=[
  "Face",
  "Eye",
  "Lip",
  "Nails",
  "Brushes & Accessories",
];
List<String>hair=[
  "Hair Care",
  "Hair Styling",
  "Hair Accessories",
  "Shop by Concern",
];
List<String>men=[
  "Skin care",
  "Accessories",
  "Hair Care",
];
List<String>momAndBaby=[
  "Baby Care Products",
  "Mother Care",
];
List<String>brands=[
  "Pax Moly",
  "Garnier",
  "J.Cat Beauty",
  "Maybelline",
  "Raip",

];
List<String>mainCategoriesImages=[
  'images/icon/skincare.png',
  'images/icon/makeup.png',
  'images/icon/hair-care.png',
  'images/icon/mens-icon.png',
  'images/icon/momscare.png',
  'images/icon/brand.png',
  'images/icon/offers.png',
];
List<String>hotdealsimages=[
  'images/hotdeals/buy-one-get-one.png',
  'images/hotdeals/combo-offer-beautysiaa.png',
  'images/hotdeals/discount-offer-beautysiaa.png',
  'images/hotdeals/flash-sale-beautysiaa.png',

];
List<String>shopByCategories=[
  'Facewash',
  'Cream',
  'Moisturizer',
  'Serum',
  'Soap',
  'Shampoo',
  'Lipsticks',
  'Lip balm',
];
List<String>shopByCategoriesImages=[
  'images/shop_category/facewash.png',
  'images/shop_category/moisturizer.png',
  'images/shop_category/moisturizer.png',
  'images/icon/skincare.png',
  'images/shop_category/sampo.png',
  'images/shop_category/sampo.png',
  'images/icon/makeup.png',
  'images/shop_category/sampo.png',
];
List<Widget>shopByCategoryList=const[
  ProductListWidget(categoryName: 'FACEWASH',subcategoryId:59 ,),
  ProductListWidget(categoryName: 'CREAM',subcategoryId:57 ,),
  ProductListWidget(categoryName: 'MOISTURISER',subcategoryId:58 ,),
  ProductListWidget(categoryName: 'SERUM',subcategoryId:60 ,),
  ProductListWidget(categoryName: 'SOAP',subcategoryId:81 ,),
  ProductListWidget(categoryName: 'SHAMPOO',subcategoryId:237 ,),
  ProductListWidget(categoryName: 'LIPSTICKS',subcategoryId:147 ,),
  ProductListWidget(categoryName: 'LIP BALM',subcategoryId:275 ,),
];