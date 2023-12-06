import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class SingleOtherProductPage extends StatefulWidget {
  String img;
  SingleOtherProductPage(this.img);

  @override
  State<SingleOtherProductPage> createState() => _SingleOtherProductPageState();
}

class _SingleOtherProductPageState extends State<SingleOtherProductPage> {
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
                    'assets/images/${widget.img}.png',
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
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
                          'Best Seller',
                          style: TextStyle(color: Colors.grey[700],
                              letterSpacing: 3),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        //name product
                        Text(
                          widget.img,
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
                                        print('tap');
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
                              Text(
                                '\$ 500',
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
                          'Nike is bringing back the original 1985 Air Jordan 1 silhouette with the release of the Air Jordan 1 Retro High 85 Black White (2023). This is the first time the black and white Air Jordan 1 has returned since their 2014 retro.',
                          style: TextStyle(color: Colors.grey[700]),
                          textAlign: TextAlign.justify,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        // add to cart
                        GestureDetector(
                          onTap: () {
                            // value.addItemToCartProductDetail(img, quantity);
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

