import 'package:flutter/material.dart';
import 'package:sneaker_app/pages/single_other_product_page.dart';

class OtherProductsPage extends StatefulWidget {
  const OtherProductsPage({super.key});

  @override
  State<OtherProductsPage> createState() => _OtherProductsPageState();
}

class _OtherProductsPageState extends State<OtherProductsPage> {
  List img = [
    'JordanmensSneaker',
    'NikeAirMax',
    'NikeAirMaxFlyknit',
    'NikeUnisex',
    'NikeWomenFitness',
    'NikeWomenSneaker',
    'JordanmensSneaker',
    'NikeAirMax',
    'NikeAirMaxFlyknit',
    'NikeUnisex',
    'NikeWomenFitness',
    'NikeWomenSneaker',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Other Products', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: (150 / 185),
          children: [
            for (int i = 0; i < img.length; i++)
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
                            builder: (context) => SingleOtherProductPage(img[i]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/${img[i]}.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            img[i],
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$500',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.add, size: 20, color: Colors.white,),
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
    );
  }
}
