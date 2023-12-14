import 'package:flutter/material.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/pages/intro_page.dart';
import 'package:sneaker_app/pages/shop_page.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/successPay.png',
                height: 250,
              ),
              SizedBox(height: 15,),
              Text(
                'Success!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, letterSpacing: 1),
              ),
              SizedBox(height: 20,),
              Text(
                  'Your order will be delivered soon',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400
                ),
              ),
              Text(
                  'Thank You! for choosing our app',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: buttonLR(() {
              // Navigate back to the ShopPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IntroPage(),
                ),
              );
            }, 'Continue Shopping'),
          )
        ],
      ),
    );
  }
}
