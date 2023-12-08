import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/pages/product_detail_page.dart';
import 'package:sneaker_app/pages/single_other_product_page.dart';

import '../models/shoe.dart';

class OtherProductsPage extends StatefulWidget {
  final List<Shoe> shoeList;
  OtherProductsPage({super.key, required this.shoeList});

  @override
  State<OtherProductsPage> createState() => _OtherProductsPageState();
}

class _OtherProductsPageState extends State<OtherProductsPage> {

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }
  // List img = [
  //   'JordanmensSneaker',
  //   'NikeAirMax',
  //   'NikeAirMaxFlyknit',
  //   'NikeUnisex',
  //   'NikeWomenFitness',
  //   'NikeWomenSneaker',
  //   'JordanmensSneaker',
  //   'NikeAirMax',
  //   'NikeAirMaxFlyknit',
  //   'NikeUnisex',
  //   'NikeWomenFitness',
  //   'NikeWomenSneaker',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Other Products', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Consumer<Cart>(builder: (context, value, child) => SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: (150 / 185),
            children: [
              for (int i = 0; i < value.shoeShop.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 8)
                      ]),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(shoe: value.shoeShop[i]),
                            ),
                          );
                        },

                        //img product
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            widget.shoeList[i].imagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      //name product
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shoeList[i].name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Best Seller',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),

                      // price product
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$' + widget.shoeList[i].price,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),

                            //icon add
                            GestureDetector(
                              onTap: (){
                                addShoeToCart(widget.shoeList[i]);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(Icons.add, size: 20, color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
