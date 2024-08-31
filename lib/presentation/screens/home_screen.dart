import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import 'details_screen.dart';


class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.productDetails.value.products?.length ?? 0,
            itemBuilder: (context, index) {
              final product = controller.productDetails.value.products![index];
              return ListTile(
                leading: Image.network(
                  product.thumbnail ?? 'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                title: Text(product.title ?? ''),
                subtitle: Text('\$${product.price} - ${product.brand ?? ''}'),
                onTap: () {
                  Get.to(() => DetailPage(product: product));
                },
              );
            },
          );
        }
      }),
    );
  }
}
