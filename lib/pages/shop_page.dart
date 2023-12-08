import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoe.dart';
import 'package:sneaker_app/pages/product_detail_page.dart';
import '../components/shoe_tile.dart';
import 'other_products_page.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShopPageState();
  }
}

class _ShopPageState extends State<ShopPage> {
  Shoe? selectedShoe;

  //add shoe to cart
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

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
            ),
          ),

          // message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            // child: Text('Everyone files... some fly loger than other'),
          ),

          // hot picks
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OtherProductsPage(shoeList: value.getShoeList()),
                      ),
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          //list of shoe for sale
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal, // lướt theo chiều ngang
              itemBuilder: (context, index) {
                // get a shoe from list
                Shoe shoe = value.getShoeList()[index];

                // return the shoe
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedShoe = shoe;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(shoe: shoe),
                      ),
                    );
                  },
                  child: ShoeTile(
                      shoe: shoe,
                      onTap: () {
                        setState(() {
                          selectedShoe = shoe;
                        });
                        addShoeToCart(shoe);
                      }),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
