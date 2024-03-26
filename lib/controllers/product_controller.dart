import 'package:acm_task_app/services/remote_services.dart';
import 'package:get/state_manager.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      print('Calling fetchProducts()');
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        print('Current product list: $productList');
      }
    } finally {
      isLoading(false);
    }
  }
}
