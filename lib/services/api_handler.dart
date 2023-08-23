import 'package:http/http.dart'as http;
class ApiHandler{
  Future<void>getAllProduct()async{
    var response = http.get(Uri.parse("https://beautysiaa.com/wp-json/wc/v3/products?consumer_key=ck_d965727e9530eff7b29344694a3aee2a3fc12624&consumer_secret=cs_bc8b1f3c7873e490826448454059839c279eb66e"));
    //print("response"${respons});
  }
}