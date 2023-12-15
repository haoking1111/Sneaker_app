import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/global/common/text_box_shipping_address.dart';
import 'package:sneaker_app/global/common/toast.dart';

import '../global/common/edit_field.dart';

class ShippingAddressSettingPage extends StatefulWidget {
  const ShippingAddressSettingPage({super.key});

  @override
  State<ShippingAddressSettingPage> createState() => _ShippingAddressSettingPageState();
}

class _ShippingAddressSettingPageState extends State<ShippingAddressSettingPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Shipping Address',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[300],
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

              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      //full name
                      TextBoxShippngAddress(
                          text: userData['fullname'],
                          sectionName: 'Full Name',
                          onPressed: () {
                            editField('fullname', context);
                          }
                      ),

                      //phone number
                      TextBoxShippngAddress(
                          text: userData['phonenumber'],
                          sectionName: 'Phone Number',
                          onPressed: () {
                            editField('phonenumber', context);
                          }
                      ),

                      //address
                      TextBoxShippngAddress(
                          text: userData['address'],
                          sectionName: 'Address',
                          onPressed: () {
                            editField('address', context);
                          }
                      ),

                      // city
                      TextBoxShippngAddress(
                          text: userData['city'],
                          sectionName: 'City',
                          onPressed: () {
                            editField('city', context);
                          }
                      ),

                      //State/province/region
                      TextBoxShippngAddress(
                          text: userData['provinceregion'],
                          sectionName: 'Province Region',
                          onPressed: () {
                            editField('provinceregion', context);
                          }
                      ),

                      //Zip code
                      TextBoxShippngAddress(
                          text: userData['zipcode'],
                          sectionName: 'Zip Code (Postal Code)',
                          onPressed: () {
                            editField('zipcode', context);
                          }
                      ),

                      //Country
                      TextBoxShippngAddress(
                          text: userData['country'],
                          sectionName: 'Country',
                          onPressed: () {
                            editField('country', context);
                          }
                      ),

                      //button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: buttonLR(() {
                          showToast(message: 'Saved Successfully');
                          Navigator.pop(context);
                        }, 'Save'),
                      ),
                    ],
                  ),
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
          }
      ),
    );
  }
}
