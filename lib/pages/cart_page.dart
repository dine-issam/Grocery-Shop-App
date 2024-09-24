import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app_mitchkoko/model/cart_model.dart';
import 'package:grocery_shop_app_mitchkoko/pages/home_page.dart';
import 'package:grocery_shop_app_mitchkoko/utils/my_list_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 175, 208, 236)),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "My cart",
            style: GoogleFonts.nunitoSans(
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
          Selector<CartModel, List>(
            selector: (context, cartModel) => cartModel.cartItems,
            // Select only the cartItems list
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return MyListTile(
                      itemImage: value[index][2],
                      itemName: value[index][0],
                      trailing: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 70.0, left: 50, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1, // Adjust the thickness of the line
                    color: Colors.grey, // Adjust the color of the line
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Or",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 1, // Adjust the thickness of the line
                    color: Colors.grey, // Adjust the color of the line
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 175, 208, 236),
            ),
            child: Column(
              children: [
                Text(
                  "Repeat previous order",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(115)),
                  child: Text(
                    "Order Now",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, top: 60),
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 91, 58, 169),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total amount",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Selector<CartModel, String>(
                      selector: (context, cartModel) =>
                          cartModel.calculateTotal(),
                      builder: (context, value, child) {
                        return Text(
                          '$value \$',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      }),
                ],
              ),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.4, color: Colors.white)),
                child: Text(
                  "Pay Now >",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ));
  }
}