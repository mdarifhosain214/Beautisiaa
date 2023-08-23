import 'package:flutter/material.dart';
import '../app_colors.dart';
class ProductCard extends StatelessWidget {
  final String img;
  final String name;
  final double oldPrice;
  final double currentPrice;
  const ProductCard({Key? key, required this.img, required this.name, required this.oldPrice, required this.currentPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        //color: Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
        border: Border.all(width: 2,color:Colors.grey.shade300 )
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            child: Image.network( img,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),maxLines: 2,overflow: TextOverflow.ellipsis,),
                Wrap(
                  children: List.generate(5,
                        (index) => Text(
                      "*",
                      style: TextStyle(
                          color: Colors.yellowAccent.shade700,
                          fontSize: 30,
                          letterSpacing: 5),
                    ),
                  ),
                ),
                Text(
                  oldPrice.toString(),
                  style: const TextStyle(
                      fontSize: 16, decoration: TextDecoration.lineThrough),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     currentPrice.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainColor),
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      // padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFF691883),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.shopping_cart_outlined,color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),)
        ],
      ),
    );
  }
}
