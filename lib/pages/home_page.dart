// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app_mitchkoko/model/cart_model.dart';
import 'package:grocery_shop_app_mitchkoko/pages/cart_page.dart';
import 'package:grocery_shop_app_mitchkoko/utils/my_cart_ui.dart';
import 'package:grocery_shop_app_mitchkoko/utils/my_list_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create an instance of CartModel
  CartModel cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CartPage();
              },
            ),
          ),
          child: const Icon(
            Icons.shopping_bag,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.black,
              ),
            ),
          ],
          title: Row(
            children: [
              const Icon(Icons.person_pin_circle_outlined),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Algeria, Oran",
                style: GoogleFonts.nunitoSans(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                "Good morning, Mate",
                style: GoogleFonts.nunitoSans(
                    fontSize: 16, color: Colors.grey[500]),
              ),
              Text(
                "Let's order fresh\nitems for you",
                style: GoogleFonts.nunitoSans(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Categories",
                style: GoogleFonts.nunitoSans(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Selector<CartModel, List>(
                selector: (context, cartModel) => cartModel.historyCartItems,
                builder: (context, value, child) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: cartModel.shopItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = cartModel.shopItems[index];
                      return MyCartUi(
                        itemName: item[0],
                        itemPrice: item[1],
                        itemImage: item[2],
                        itemColor: item[3],
                        onTap: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addToCart(index),
                      );
                    },
                  ));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "My last Orders",
                style: GoogleFonts.nunitoSans(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
           Selector<CartModel, List>(
            selector: (context, cartModel) => cartModel.historyCartItems,
            builder: (context, cartItems, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return MyListTile(
                      itemImage: cartItems[index]['item'][2],
                      itemName: cartItems[index]['item'][0],
                      subtitle: Text('22 dec, 2024',style: GoogleFonts.nunitoSans(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),),
                      trailing: RichText(
                        text: TextSpan(
                            text:
                                '\$${(double.parse(cartItems[index]['item'][1]) * cartItems[index]['quantity']).toStringAsFixed(2)}\n',
                            style: GoogleFonts.nunitoSans(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${cartItems[index]['quantity']} items',
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ));
  }
}
