// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sneaker_app/global/common/text_box_inf.dart';
// import 'package:sneaker_app/global/common/logout.dart';
// import 'package:sneaker_app/global/common/toast.dart';
//
// import '../global/common/edit_field.dart';
// import 'change_password_page.dart';
//
// class AccountDetailsPage extends StatefulWidget {
//   @override
//   State<AccountDetailsPage> createState() => _AccountDetailsPageState();
// }
//
// class _AccountDetailsPageState extends State<AccountDetailsPage> {
//   //user
//   final currentUser = FirebaseAuth.instance.currentUser!;
//
//   //all user
//   final usersCollection = FirebaseFirestore.instance.collection("users");
//
//   //new password
//   final String newPassword = '';
//
//   //change pasword
//   Future<void> changePassword() async {
//     try {
//       await currentUser.updatePassword(newPassword);
//       FirebaseAuth.instance.signOut();
//       showToast(message: 'Your password has been changed. Please log in again.');
//     } catch (e) {
//       print(e);
//       showToast(message: 'Failed to change password. Please try again.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser.email)
//           .snapshots(),
//       builder: (context, snapshot) {
//         // get user data
//         if (snapshot.hasData) {
//           final userData = snapshot.data!.data() as Map<String, dynamic>;
//           print(userData);
//
//           return Container(
//             child: ListView(
//               children: [
//                 //account pic
//                 Column(
//                   children: [
//                     Icon(
//                       Icons.person,
//                       size: 72,
//                     ),
//
//                     SizedBox(
//                       height: 10,
//                     ),
//
//                     // user email
//                     Text(
//                       userData['username'],
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                   ],
//                 ),
//
//                 // user detail
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25.0),
//                   child: Text(
//                     'My Details',
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//
//                 // username
//                 MyTextBox(
//                   text: userData['username'],
//                   sectionName: 'User Name',
//                   onPressed: () {
//                     editField('username', context);
//                   },
//                 ),
//
//                 //birthday
//                 MyTextBox(
//                   text: userData['birthdate'],
//                   sectionName: 'Birth Date',
//                   onPressed: () {
//                     editField('birthdate', context);
//                   },
//                 ),
//
//                 //phonenumber
//                 MyTextBox(
//                   text: userData['phonenumber'],
//                   sectionName: 'Phone Number',
//                   onPressed: () {
//                     editField('phonenumber', context);
//                   },
//                 ),
//
//                 //email address
//                 MyTextBox(
//                   text: userData['emailaddress'],
//                   sectionName: 'Email Address',
//                   onPressed: () {
//                     editField('emailaddress', context);
//                   },
//                 ),
//
//                 //address
//                 MyTextBox(
//                   text: userData['address'],
//                   sectionName: 'Address',
//                   onPressed: () {
//                     editField('address', context);
//                   },
//                 ),
//
//                 // change password
//                 MyTextBox(
//                     text: '*********',
//                     sectionName: 'Change Password',
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => ChangPassWordPage(),));
//                     },
//                 ),
//
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
//                   child: Divider(color: Colors.white,),
//                 ),
//
//                 Padding(
//                   padding: EdgeInsets.only(right: 20, left: 35, bottom: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                           'Logout',
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//
//                       IconButton(
//                           onPressed: () {
//                             logout(context);
//                           },
//                           icon: Icon(Icons.logout,)
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error ${snapshot.error}'),
//           );
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
