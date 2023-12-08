import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/components/text_box.dart';
import 'package:sneaker_app/global/common/logout.dart';
import 'package:sneaker_app/global/common/toast.dart';

import 'change_password_page.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //all user
  final usersCollection = FirebaseFirestore.instance.collection("users");

  //new password
  final String newPassword = '';

  //edit field
  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Colors.grey[900],
            title: Text(
              'Edit ' + field,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            content: TextField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Enter new $field',
                  hintStyle: TextStyle(color: Colors.grey)),
              onChanged: (value) {
                newValue = value;
              },
            ),
            actions: [
              //cancle button
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  )),

              //save button
              TextButton(
                  onPressed: () => Navigator.of(context).pop(newValue),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
    );

    // update in firestore
    if (newValue
        .trim()
        .length > 0) {
      // only update if there is something in the textField
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }
  //change pasword
  Future<void> changePassword() async {
    try {
      await currentUser.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      showToast(message: 'Your password has been changed. Please log in again.');
    } catch (e) {
      print(e);
      showToast(message: 'Failed to change password. Please try again.');
    }
  }

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
                Icons.person,
                size: 72,
              ),

              SizedBox(
                height: 10,
              ),

              // user email
              Text(
                userData['username'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),

              // user detail
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'My Details',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),

              // username
              MyTextBox(
                text: userData['username'],
                sectionName: 'User Name',
                onPressed: () {
                  editField('username');
                },
              ),

              //birthday
              MyTextBox(
                text: userData['birthdate'],
                sectionName: 'Birth Date',
                onPressed: () {
                  editField('birthdate');
                },
              ),

              //phonenumber
              MyTextBox(
                text: userData['phonenumber'],
                sectionName: 'Phone Number',
                onPressed: () {
                  editField('phonenumber');
                },
              ),

              //email address
              MyTextBox(
                text: userData['emailaddress'],
                sectionName: 'Email Address',
                onPressed: () {
                  editField('emailaddress');
                },
              ),

              //address
              MyTextBox(
                text: userData['address'],
                sectionName: 'Address',
                onPressed: () {
                  editField('address');
                },
              ),

              // change password
              MyTextBox(
                  text: '*********',
                  sectionName: 'Change Password',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangPassWordPage(),));
                  },
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                child: Divider(color: Colors.white,),
              ),

              Padding(
                padding: EdgeInsets.only(right: 20, left: 35, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Logout',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    IconButton(
                        onPressed: () {
                          logout(context);
                        },
                        icon: Icon(Icons.logout,)
                    ),
                  ],
                ),
              ),
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
}
