import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;


  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath,width: 60, height: 60,),
        title: Text(widget.shoe.name),
        subtitle: Row(
          children: [
            // price
            Text('\$' + widget.shoe.price),

            SizedBox(width: 70,),

            //quantity
            Text('x' + (widget.shoe.quantity.toString())),

          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.grey[800],),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}