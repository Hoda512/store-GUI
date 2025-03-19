import 'package:cc/Change_Theme.dart';
import 'package:cc/HomePage.dart';
import 'package:cc/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Catigories.dart';
import 'Search.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int curr = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/pic.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mahmoud Diab",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "mahmouddiab6600@gmail.com",
              style: TextStyle(color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                size: 30,
                color: Colors.white60,
              ),
              title: Text(
                "My Order",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white60,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark_rounded,
                size: 30,
                color: Colors.white60,
              ),
              title: Text(
                "Help & Support",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white60,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.warning,
                size: 30,
                color: Colors.white60,
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white60,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
              child: ListTile(
                leading: Icon(
                  Icons.dark_mode,
                  size: 30,
                  color: Colors.white60,
                ),
                title: Text(
                  "Change Theme",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white60,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.white60,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Get.off(SignIn());
                });
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 20),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
