// detail_page.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/product_details_model.dart';



class DetailPage extends StatelessWidget {
  final Products product;

  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? '')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: (product.images != null && product.images!.isNotEmpty
                  ? product.images!
                  : ['https://via.placeholder.com/400'])
                  .map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(i, fit: BoxFit.cover, width: 1000);
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Rating: ${product.rating}",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Brand: ${product.brand ?? ''}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Category: ${product.category ?? ''}",
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more fields as necessary
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
