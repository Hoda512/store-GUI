import 'package:cached_network_image/cached_network_image.dart';
import 'package:cc/Profile.dart';
import 'package:cc/Search.dart';
import 'package:cc/api_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './model/product_response.dart';

class Catigories extends StatefulWidget {
  const Catigories({super.key});

  @override
  State<Catigories> createState() => _CatigoriesState();
}

List items = [
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
  {
    "image": "https://img.youm7.com/large/20180420010544544.jpg",
    "Name": "Product Name",
    "Sale": "\$99.99"
  },
];

class _CatigoriesState extends State<Catigories> {
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: curr,
            onTap: (i) {
              setState(() {
                curr = i;
              });
              if (i == 0) {
                Get.offAll(Catigories());
              }
              if (i == 1) {
                Get.offAll(Search());
              }
              if (i == 2) {
                Get.offAll(Profile());
              }
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ]),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<ProductResponse>>(
            future: api_mager().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text(snapshot.hasError.toString());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text("error data");
              }
              final List<ProductResponse>? product = snapshot.data;
              return Expanded(
                child: GridView.builder(
                  itemCount: product?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final ProductResponse item = product![index];
                    return Product_Container(
                        image_url: item.images?[0] ?? "",
                        Product_name: item.title ?? "",
                        Product_price: item.price.toString());
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Product_Container extends StatelessWidget {
  const Product_Container(
      {super.key,
      required this.image_url,
      required this.Product_name,
      required this.Product_price});
  final String image_url;
  final String Product_name;
  final String Product_price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: image_url,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 1,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(Product_name),
            Text(Product_price),
          ],
        ),
      ),
    );
  }
}
