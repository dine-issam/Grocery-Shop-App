import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app_mitchkoko/model/cart_model.dart';

class MyCartUi extends StatelessWidget {
  MyCartUi({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemColor,
    required this.onTap,
  });
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final Color itemColor;

  final cartModel = CartModel();
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 5),
            decoration: BoxDecoration(
                color: itemColor, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  itemImage,
                  height: 80,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemName,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "$itemPrice\$",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
