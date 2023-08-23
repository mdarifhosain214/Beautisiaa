import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../pages/home_page.dart';
import '../../utilities/data.dart';
class CategoryOfBrands extends StatefulWidget {
  final String mainCategoryName;
  const CategoryOfBrands({Key? key, required this.mainCategoryName}) : super(key: key);
  @override
  State<CategoryOfBrands> createState() => _CategoryOfBrandsState();
}
class _CategoryOfBrandsState extends State<CategoryOfBrands> {
  final PageController _pageController =PageController();
  Widget searchBar() {
    return Container(
      //height:size.height*0.06,
      height: 50,
      width: double.infinity - 50,
      decoration: BoxDecoration(
        // color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(8.0),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(widget.mainCategoryName,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: "Montserrat"),),
      ),
      body: Column(
        children: [
          searchBar(),
          Container(
            height:MediaQuery.of(context).size.width*0.22,
            //color: Colors.black,
            margin: const EdgeInsets.only(left: 8,bottom: 10),
            child: ListView.builder(
                itemCount: skinCare.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn);
                    },
                    child: Container(
                      height:MediaQuery.of(context).size.width*0.22,
                      width: MediaQuery.of(context).size.width*0.22,
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(8),
                      decoration:  BoxDecoration(
                        //color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey,width: 1)
                      ),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.ice_skating,size: 40,),
                          Text(skinCare[index])

                        ],
                      ),
                    ),
                  );
                }),),
          SizedBox(
            //color: Colors.red,
            height: MediaQuery.of(context).size.height*0.6735,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height:MediaQuery.of(context).size.height*0.6735,
                  margin: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 350
                  ), itemBuilder: (context,index){
                    return const CardForHome(
                      imgUrl:
                      "https://beautysiaa.com/wp-content/uploads/2023/01/pax-moly-niacinamide-5-hyaluronic-acid-5-ac-serum-300x300.jpg",
                      productName: "Pax Moly Niacinamide 5% Hyaluronic Acid 5% AC Serum 50ml",
                      oldPrice: '1259',
                      currentPrice: '950',
                    );
                  }),
                ),
                Container(
                  height:MediaQuery.of(context).size.height*0.663,
                  margin: const EdgeInsets.all(8),
                  // color: Colors.black,
                  child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 350
                  ), itemBuilder: (context,index){
                    return const CardForHome(
                      imgUrl:
                      "https://beautysiaa.com/wp-content/uploads/2023/01/pax-moly-niacinamide-5-hyaluronic-acid-5-ac-serum-300x300.jpg",
                      productName: "Pax Moly Niacinamide 5% Hyaluronic Acid 5% AC Serum 50ml",
                      oldPrice: '1259',
                      currentPrice: '950',
                    );
                  }),
                ),
                Container(
                  height:MediaQuery.of(context).size.height*0.65,
                  color: Colors.yellow,
                ),
                Container(
                  height:MediaQuery.of(context).size.height*0.663,
                  color: Colors.black,
                ),
                Container(
                  height:MediaQuery.of(context).size.height*0.663,
                  color: Colors.red,
                ),
                Container(
                  height:MediaQuery.of(context).size.height*0.663,
                  color: Colors.yellow,
                  child: const Center(child: Text("Hello"),),
                ),
                Container(
                  height:MediaQuery.of(context).size.height*0.663,
                  color: Colors.deepOrange,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
