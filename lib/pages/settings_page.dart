import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneaker_app/pages/shipping_address_page.dart';
import 'package:sneaker_app/pages/shipping_address_setting_page.dart';

import '../global/common/edit_field.dart';
import '../global/common/logout.dart';
import '../global/common/text_box_inf.dart';
import '../global/common/toast.dart';
import 'change_password_page.dart';
import 'credit_card_page.dart';
import 'language_page.dart';
import 'notifications_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //all user
  final usersCollection = FirebaseFirestore.instance.collection("users");

  //new password
  final String newPassword = '';

  //change pasword
  Future<void> changePassword() async {
    try {
      await currentUser.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      showToast(
          message: 'Your password has been changed. Please log in again.');
    } catch (e) {
      print(e);
      showToast(message: 'Failed to change password. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            // get user data
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              print(userData);

              return Container(
                color: Colors.grey[300],
                child: ListView(
                  children: [
                    // username
                    MyTextBox(
                      text: userData['username'],
                      sectionName: 'User Name',
                      onPressed: () {
                        editField('username', context);
                      },
                    ),

                    //birthday
                    MyTextBox(
                      text: userData['birthdate'],
                      sectionName: 'Birth Date',
                      onPressed: () {
                        editField('birthdate', context);
                      },
                    ),

                    //phonenumber
                    MyTextBox(
                      text: userData['phonenumber'],
                      sectionName: 'Phone Number',
                      onPressed: () {
                        editField('phonenumber', context);
                      },
                    ),

                    //email address
                    MyTextBox(
                      text: userData['emailaddress'],
                      sectionName: 'Email Address',
                      onPressed: () {
                        editField('emailaddress', context);
                      },
                    ),

                    const Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0, bottom: 20),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),

                    SettingItems(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingAddressSettingPage(),));
                    }, FontAwesomeIcons.truckFast, 'Shipping Information'),

                    SettingItems(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreditCardPage(),));
                    }, FontAwesomeIcons.wallet, 'Payment Information'),

                    const Padding(
                      padding:
                      EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),

                    SettingItems(() => null, FontAwesomeIcons.locationDot, 'Location Setting'),

                    SettingItems(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage(),));
                    }, FontAwesomeIcons.solidBell, 'Notifications'),

                    SettingItems(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage(),));
                    }, FontAwesomeIcons.language, 'Language'),

                    const Padding(
                      padding:
                      EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),

                    SettingItems(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangPassWordPage(),));
                    }, FontAwesomeIcons.lock, 'Change Password')
                  ],
                ),
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
        )
    );
  }
  Widget SettingItems(Function() nameFuntion, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: nameFuntion,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
