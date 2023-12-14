import 'package:flutter/material.dart';

class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Purchase Histopry', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Nothing to see here - yet',
                  style: TextStyle(
                    fontSize: 17,fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                    'We\'ll store your purchase here as soon as you make them.',
                  style: TextStyle(fontSize: 14)),

              ],
            ),
          )
      ),
    );
  }
}
