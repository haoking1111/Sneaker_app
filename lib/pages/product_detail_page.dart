import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoe.dart';

class ProductDetailPage extends StatefulWidget {
  final Shoe shoe;

  ProductDetailPage({super.key, required this.shoe});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>
        Scaffold(
          // backgroundColor: Colors.grey[300],
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // img product
                  Image.asset(
                    widget.shoe.imagePath,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: 300,
                  ),

                  // Text('Name: ${shoe.name}'),
                  // Text('Price: \$${shoe.price}'),
                  // Thêm các thông tin khác về sản phẩm nếu cần

                  SizedBox(
                    height: 50,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //hot picks
                        Text(
                          'Hot Picks 🔥',
                          style: TextStyle(color: Colors.grey[700],
                              letterSpacing: 3),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        //name product
                        Text(
                          widget.shoe.name,
                          style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        //quanlity product
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if(quantity>1) {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 15,
                                    ),

                                    Text(
                                      quantity.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),

                                    SizedBox(
                                      width: 15,
                                    ),

                                    GestureDetector(
                                      onTap:() {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: Icon(
                                        CupertinoIcons.plus,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // price
                              Text(
                                '\$${widget.shoe.price}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        //description product
                        Text(
                          widget.shoe.description,
                          style: TextStyle(color: Colors.grey[700]),
                          textAlign: TextAlign.justify,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        // add to cart
                        GestureDetector(
                          onTap: () {
                            value.addItemToCartProductDetail(widget.shoe, quantity);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Successfully added!'),
                                content: Text('Check your cart'),
                              ),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(13)
                              ),
                              child: Text(
                                'Add to cart',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
