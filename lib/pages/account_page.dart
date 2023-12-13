import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneaker_app/global/common/loading_p.dart';
import 'package:sneaker_app/pages/account_details_page.dart';
import 'package:sneaker_app/pages/privacy_page.dart';
import 'package:sneaker_app/pages/purchase_history_page.dart';

import '../global/common/logout.dart';
import 'help_and_support_page.dart';
import 'settings_page.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        // get user data
        if (snapshot.hasData) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          print(userData);

          return ListView(
            children: [
              //account pic
              Icon(
                FontAwesomeIcons.solidCircleUser,
                size: 80,
              ),

              SizedBox(
                height: 10,
              ),

              // user
              Text(
                userData['username'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),

              // user email
              Text(
                userData['emailaddress'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[900]),
              ),

              SizedBox(
                height: 30,
              ),

              //
              ProfileListItem(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPage(),));
              }, FontAwesomeIcons.userShield, 'Privacy'),
              //
              ProfileListItem(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseHistoryPage(),));
              }, FontAwesomeIcons.clockRotateLeft, 'Purchase History'),
              //
              ProfileListItem(() => null, FontAwesomeIcons.wallet, 'Billing Details'),
              //
              ProfileListItem(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
              }, FontAwesomeIcons.gear, 'Settings'),
              //
              ProfileListItem(() => null, FontAwesomeIcons.userPlus, 'Invite a Friend'),
              //
              ProfileListItem(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpAndSupportPage(),));
              }, FontAwesomeIcons.solidCircleQuestion, 'Help & Support'),

              // username

              const Padding(
                padding: EdgeInsets.only(left:25, right: 25, bottom: 10),
                child: Divider(
                  color: Colors.white,
                ),
              ),

              //
              GestureDetector(
                onTap: () {
                  logout(context);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            size: 18,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error ${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget ProfileListItem(Function() nameFuntion, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: nameFuntion,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 18,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.angleRight,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
