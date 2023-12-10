import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/global/common/loading_p.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/pages/payment_method_page.dart';

import '../models/shoe.dart';
import 'order_success_page.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //calculator total price
  double calculateTotal(List<Shoe> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      double price = double.parse(item.price);
      int quantity = item.quantity; // Assuming each Shoe has a 'quantity' property
      total += price * quantity;
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Confirm Order',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 145,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 4, spreadRadius: 2)
                  ]
              ),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(currentUser.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    // get user data
                    if (snapshot.hasData) {
                      final userData = snapshot.data!.data() as Map<String, dynamic>;
                      print(userData);

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dear: ' + userData['fullname'],
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Change',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.redAccent),
                                    )
                                )
                              ],
                            ),
                            Text(
                              'Phone: '+ userData['phonenumber'],
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Address: ' + userData['address'],
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              'Province Region: '+ userData['provinceregion'],
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Country: ' + userData['country'],
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                            ),
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
                  }
              )
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage(),));
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          fontSize: 16, color: Colors.redAccent),
                    )
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 4, spreadRadius: 2),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/visaPay.png'),
                    SizedBox(width: 20,),

                    Text('**** **** **** 1410', style: TextStyle(fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Text(
              'Delivery Method',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12, blurRadius: 4, spreadRadius: 2),
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/delivery.png',
                          height: 30,
                        ),
                        Center(child: Text('2-7 Days',))
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 20,),

                Container(
                  width: 140,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12, blurRadius: 4, spreadRadius: 2),
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Home Delivery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.indigo),),
                        Center(child: Text('2-7 Days',))
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            Consumer<Cart>(
              builder: (context, value, child) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub-Total',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        '\$${calculateTotal(value.getUserCart()).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Fee',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        '\$15.00',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    height: 15,
                    color: Colors.black,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payment',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        '\$${(calculateTotal(value.getUserCart()) + 15.00).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 40,),

            buttonLR(() {
              loadingPage(context, OrderSuccessPage());
            }, 'Confirm Oder')

          ],
        ),
      )),
    );
  }
}
