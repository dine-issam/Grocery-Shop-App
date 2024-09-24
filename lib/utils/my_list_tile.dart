import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.itemName,
    required this.itemImage,
    required this.trailing,
    required this.subtitle, 
  });

  final Widget? trailing;
  final String itemName;
  final String itemImage;
  final Widget subtitle; 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(itemImage),
      title: Text(
        itemName,
        style:
            GoogleFonts.nunitoSans(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle, 
      trailing: trailing,
    );
  }
}
