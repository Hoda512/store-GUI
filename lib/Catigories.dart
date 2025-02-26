import 'package:cc/Profile.dart';
import 'package:cc/Search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "  Categories",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Electronics",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Fashion",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Home & Kitchen",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Games",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            items[index]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " ${items[index]["Name"]}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          " ${items[index]["Sale"]}",
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
