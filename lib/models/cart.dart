import 'package:flutter/material.dart';

import 'shoe.dart';
class Cart extends ChangeNotifier{
  // list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Nike Dunk High',
        price: '540',
        quantity: 1,
        description: 'The Nike Dunk High \'Laser Blue\' highlights the shoe\'s classic lines with a traditional colorway reminiscent of the iconic \'Be True to Your\' line from 1985. The leather upper combines a crisp white base with contrasting overlays in light blue',
        imagePath: 'assets/images/NikeDunkHigh.png'
    ),

    Shoe(
        name: 'AirJordan HighG',
        price: '320',
        quantity: 1,
        description: 'Nike is bringing back the original 1985 Air Jordan 1 silhouette with the release of the Air Jordan 1 Retro High 85 Black White (2023). This is the first time the black and white Air Jordan 1 has returned since their 2014 retro.',
        imagePath: 'assets/images/Jordan1.png'
    ),

    Shoe(
        name: 'Nike Air Max',
        price: '425',
        quantity: 1,
        description: 'This Nike Air Max 97 "OG" edition comes in a white, wolf grey and black colorway. Made to commemorate the 30th Anniversary of the classic Air Max silhouette. This pair sports a clean all-white upper and sole with the only hits of color coming from the grey branding. ',
        imagePath: 'assets/images/NikeAirMax90.png'
    ),

    Shoe(
        name: 'Nike Air Force',
        price: '650',
        quantity: 1,
        description: 'The Nike Air Force 1 Low White ‘07 features an all-white leather upper with a perforated toe box and Swoosh overlays. A Nike heel embroidery and white sole completes the design.The Nike Air Force 1 Low White ‘07 originally released in 2007.',
        imagePath: 'assets/images/NikeAirForce2.png'
    ),

    Shoe(
        name: 'JBalvin x AirJordan',
        price: '980',
        quantity: 1,
        description: 'The Jordan 11 Retro Gratitude / Defining Moments (2023) is a nod to the illustrious heritage encapsulated in the Jordan brand. This iconic Jordan 11 model resurfaces with a touch of the famous Defining Moments colorway.',
        imagePath: 'assets/images/JBalvinxAirJordan1High.png'
    ),

    Shoe(
        name: 'Nike Air Scorpion',
        price: '560',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/NikeAirMaxScorpionFlyknit.png'
    ),

    // other products
    Shoe(
        name: 'Jordan Mens Sneaker',
        price: '351',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/JordanmensSneaker.png'
    ),

    Shoe(
        name: 'Nike Air Max',
        price: '874',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/NikeAirMax.png'
    ),

    Shoe(
        name: 'Nike Air Max Flyknit',
        price: '555',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/NikeAirMaxFlyknit.png'
    ),

    Shoe(
        name: 'Nike Unisex',
        price: '381',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/NikeUnisex.png'
    ),

    Shoe(
        name: 'Nike Women Fitness',
        price: '482',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/NikeWomenFitness.png'
    ),

    Shoe(
        name: 'Nike Women Sneaker',
        price: '230',
        quantity: 1,
        description: 'The Triple Black Nike Air Max Scorpion FK sneaker showcases a sleek, all-black Flyknit upper that offers a sock-like fit, providing unparalleled comfort and flexibility. Its Triple Black colorway exudes a sophisticated and modern aesthetic.',
        imagePath: 'assets/images/NikeWomenSneaker.png'
    ),

  ];

  // list of items in user cart
  List<Shoe> userCart = [];
  
  // get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }
  
  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }
  
  // add items to cart
  // void addItemToCart(Shoe shoe) {
  //   userCart.add(shoe);
  //   notifyListeners();
  // }
  // add items to cart
  void addItemToCart(Shoe shoe) {
    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    bool isProductInCart = userCart.any((item) => item.name == shoe.name);

    if (isProductInCart) {
      // Nếu đã có, tăng số lượng lên 1
      userCart.firstWhere((item) => item.name == shoe.name).quantity++;
    } else {
      // Nếu chưa có, thêm sản phẩm mới vào giỏ hàng
      userCart.add(shoe);
    }

    notifyListeners();
  }

  void addItemToCartProductDetail(Shoe shoe, int quantity) {
    bool isProductInCart = userCart.any((item) => item.name == shoe.name);

    if (isProductInCart) {
      userCart.firstWhere((item) => item.name == shoe.name).quantity += quantity;
    } else {
      shoe.quantity = quantity;
      userCart.add(shoe);
    }

    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}