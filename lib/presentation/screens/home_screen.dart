import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:product_application/presentation/screens/signin_screen.dart';
import '../../controller/home_controller.dart'; // Adjust the path as needed
import 'details_screen.dart'; // Adjust the path as needed

class HomePage extends StatelessWidget {
  final String? displayName;

  HomePage({this.displayName});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () async {
              await _signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(product: product)),
                  );
                },
              );
            },
          );
        }
      }),
    );
  }

  Future<void> _signOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
