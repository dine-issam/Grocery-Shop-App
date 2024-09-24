import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.itemName,
    required this.itemImage,
    required this.trailing,

  });
  final Widget? trailing;
  final String itemName;
  final String itemImage;


  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(itemImage),
        title: Text(
          itemName,
          style:
              GoogleFonts.nunitoSans(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
         "0",
          style: GoogleFonts.nunitoSans(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        trailing: trailing);
  }
}
