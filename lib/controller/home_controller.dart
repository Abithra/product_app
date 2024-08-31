
import 'package:get/get.dart';

import '../model/product_details_model.dart';
import '../services/product_details_services.dart';



class HomeController extends GetxController {
  var isLoading = true.obs;
  var productDetails = ProductsDetails().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var details = await ProductService().fetchProducts();
      productDetails(details);
    } finally {
      isLoading(false);
    }
  }
}
