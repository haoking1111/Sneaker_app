import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/global/common/loading_p.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/pages/payment_method_page.dart';
import '../components/cart_item.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {

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

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
              child: Divider(color: Colors.white,),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

                Text(
                  '\$${calculateTotal(value.getUserCart()).toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),

            SizedBox(height: 15,),
            
            GestureDetector(
              onTap: () {
                loadingPage(context, PaymentMethodPage());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(13)
                ),
                child: Center(child: Text('Pay Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
