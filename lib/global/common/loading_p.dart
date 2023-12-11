import 'package:flutter/material.dart';

void loadingPage(BuildContext context, Widget namePage) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );

  // Delay for 1 second before navigating to ShippingAddress
  Future.delayed(Duration(seconds: 1), () {
    // Dismiss the loading circle
    Navigator.of(context).pop();

    // Navigate to ShippingAddress
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => namePage,
      ),
    );
  }
  );
}