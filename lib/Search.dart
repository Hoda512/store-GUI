import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Catigories.dart';
import 'Profile.dart';
import './api_manger.dart';
import './model/product_response.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int curr = 1;
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  List<ProductResponse> productList = [];
  final ApiService apiService = ApiService();

  void performSearch(String query) async {
    setState(() {
      isLoading = true;
    });

    List<ProductResponse> results = await apiService.searchProducts(query);

    setState(() {
      productList = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        currentIndex: curr,
        onTap: (i) {
          if (i != curr) {
            setState(() {
              curr = i;
            });
            if (i == 0) {
              Get.offAll(() => Catigories());
            }
            if (i == 2) {
              Get.offAll(() => Profile());
            }
          }
        },
        items: [
          BottomNavigationBarItem(
            icon:
                Icon(Icons.home, color: curr == 0 ? Colors.white : Colors.grey),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: curr == 1 ? Colors.white : Colors.grey),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: curr == 2 ? Colors.white : Colors.grey),
            label: "Profile",
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Search", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: searchController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search Products",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                  onFieldSubmitted: (value) {
                    performSearch(value);
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white))
                  : productList.isEmpty
                      ? Center(
                          child: Text("No products found",
                              style: TextStyle(color: Colors.white)))
                      : ListView.separated(
                          itemCount: productList.length,
                          separatorBuilder: (context, index) =>
                              Divider(height: 1, color: Colors.grey[700]),
                          itemBuilder: (context, index) {
                            var product = productList[index];
                            return ListTile(
                              leading: product.images != null &&
                                      product.images!.isNotEmpty
                                  ? Image.network(product.images!.first,
                                      width: 50, height: 50, fit: BoxFit.cover)
                                  : Icon(Icons.image_not_supported,
                                      size: 50, color: Colors.grey),
                              title: Text(
                                product.title ?? "No Title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle: Text("\$${product.price}",
                                  style: TextStyle(color: Colors.green)),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 18),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
