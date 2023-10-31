import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/models/cart.dart';

import '../components/cart_item.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            SizedBox(height: 20,),

            Expanded(
                child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  //get individual shoe
                  Shoe individualShoe = value.getUserCart()[index];

                  return CartItem(shoe: individualShoe);
                },
                )
            )
          ],
        ),
      ),
    );
  }
}
