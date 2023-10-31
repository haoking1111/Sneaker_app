import 'package:flutter/material.dart';

import 'shoe.dart';
class Cart extends ChangeNotifier{
  // list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Nike Dunk High',
        price: '540',
        description: 'Feel unbeatable, from the tee box to the final putt',
        imagePath: 'assets/images/NikeDunkHigh.png'
    ),

    Shoe(
        name: 'AirJordan HighG',
        price: '320',
        description: 'Feel unbeatable, from the tee box to the final putt',
        imagePath: 'assets/images/Jordan1.png'
    ),

    Shoe(
        name: 'Nike Air Max',
        price: '425',
        description: 'Feel unbeatable, from the tee box to the final putt',
        imagePath: 'assets/images/NikeAirMax90.png'
    ),

    Shoe(
        name: 'Nike Air Force ',
        price: '650',
        description: 'Feel unbeatable, from the tee box to the final putt',
        imagePath: 'assets/images/NikeAirForce2.png'
    ),

    Shoe(
        name: 'JBalvin x AirJordan',
        price: '980',
        description: 'Feel unbeatable, from the tee box to the final putt',
        imagePath: 'assets/images/JBalvinxAirJordan1High.png'
    ),

    Shoe(
        name: 'Nike Air Scorpion',
        price: '560',
        description: 'Feel unbeatable, from the tee box to the final putt',
        imagePath: 'assets/images/NikeAirMaxScorpionFlyknit.png'
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
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}