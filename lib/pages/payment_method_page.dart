import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/global/common/loading_p.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/pages/shipping_address_page.dart';

import '../models/shoe.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  double calculateTotal(List<Shoe> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      double price = double.parse(item.price);
      int quantity =
          item.quantity; // Assuming each Shoe has a 'quantity' property
      total += price * quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Method',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        centerTitle: true,
        // backgroundColor: Colors.grey[300],
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => SingleChildScrollView(
          child: SafeArea(
            child: Container(
              // color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),

                      // Amazon Payment
                      Container(
                        width: size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          border: _type == 1
                              ? Border.all(width: 2, color: Colors.black)
                              : Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: _type,
                                      onChanged: _handleRadio,
                                      activeColor: Colors.black,
                                    ),
                                    Text(
                                      'Amazon Pay',
                                      style: _type == 1
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/amazonPay.png',
                                  width: 85,
                                  height: 85,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //Card Pay
                      Container(
                        width: size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          border: _type == 2
                              ? Border.all(width: 2, color: Colors.black)
                              : Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: _type,
                                      onChanged: _handleRadio,
                                      activeColor: Colors.black,
                                    ),
                                    Text(
                                      'Credit Card',
                                      style: _type == 2
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/images/visaPay.png',
                                  width: 45,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'assets/images/mastercardPay.png',
                                  width: 45,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //Paypal payment
                      Container(
                        width: size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          border: _type == 3
                              ? Border.all(width: 2, color: Colors.black)
                              : Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 3,
                                      groupValue: _type,
                                      onChanged: _handleRadio,
                                      activeColor: Colors.black,
                                    ),
                                    Text(
                                      'Paypal Pay',
                                      style: _type == 3
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/paypalPay.png',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //Google payment
                      Container(
                        width: size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          border: _type == 4
                              ? Border.all(width: 2, color: Colors.black)
                              : Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 4,
                                      groupValue: _type,
                                      onChanged: _handleRadio,
                                      activeColor: Colors.black,
                                    ),
                                    Text(
                                      'Google Pay',
                                      style: _type == 4
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/googlePay.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),

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
                      SizedBox(
                        height: 70,
                      ),

                      buttonLR(() {
                        loadingPage(context, ShippingAddress());
                      }, 'Confirm Payment')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
