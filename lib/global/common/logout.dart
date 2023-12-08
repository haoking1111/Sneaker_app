import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/global/common/toast.dart';

void logout(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );
  Future.delayed(Duration(seconds: 1), () async {
    await FirebaseAuth.instance.signOut();
    // Tắt Dialog sau khi đã logout thành công
    Navigator.of(context).pop();
    // FirebaseAuth.instance.signOut();
    showToast(message: 'Successfully signed out');
  });
}