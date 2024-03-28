import 'package:acm_task_app/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    try {
    var response = await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));
    if (response.statusCode == 200){
      var jsonString = response.body;
      if (jsonString != null){
        print('jsonString value: $jsonString');
        return productFromJson(jsonString);
      }
      else {
        //Handling null response body
        print('fetchProducts() error: response body is null');
        return null;
      }
    }
    else {
      //Handling non-200 status code
      print('fetchProducts() error: HTTP ${response.statusCode}');
      return null;
    }
  }
  catch (e){
    //Handling other exceptions
    print('fetchProducts() error: $e');
    return null;
  }
  }
}