import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> editField(String field, context) async {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //all user
  final usersCollection = FirebaseFirestore.instance.collection("users");

  //new password
  final String newPassword = '';
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