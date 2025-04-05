import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const CustomTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.yellow, Colors.orangeAccent],
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Expanded(child: Text(title, style: GoogleFonts.rowdies())),
      ),
    );
  }
}
