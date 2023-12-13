import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/components/bottom_nav_bar.dart';
import 'package:sneaker_app/global/common/toast.dart';
import 'package:sneaker_app/pages/account_details_page.dart';
import 'package:sneaker_app/pages/account_page.dart';
import 'package:sneaker_app/pages/shop_page.dart';
import '../global/common/logout.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this medthod will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display

  final List<Widget> _pages = [
    // shop page
    ShopPage(),

    // cart page
    CartPage(),

    // account page
    AccountPage(),
  ];

  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) {
          navigateBottomBar(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              )),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/nike.png',
                    color: Colors.white,
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(
                            'users') // Đảm bảo rằng bạn sử dụng tên collection đúng
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // Lấy dữ liệu từ snapshot
                        final userData =
                            snapshot.data!.data() as Map<String, dynamic>;

                        // Lấy giá trị của trường "username"
                        final username = userData['username'];

                        return listTitleDrawer(Icons.person, username);

                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return CircularProgressIndicator(); // Hiển thị thanh loading khi đang lấy dữ liệu
                      }
                    },
                  ),
                ),

                // Home
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: listTitleDrawer(Icons.home, 'Home'),
                ),

                // About
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: listTitleDrawer(Icons.info_rounded, 'About'),
                ),
              ],
            ),

            //Logout
            Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: GestureDetector(
                onTap: () {
                  logout(context);
                },
                child: listTitleDrawer(Icons.logout, 'Logout')
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  Widget listTitleDrawer(IconData nameIcon, String name) {
    return ListTile(
      leading: Icon(
        nameIcon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
