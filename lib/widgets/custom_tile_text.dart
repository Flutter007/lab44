import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTileText extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTileText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleMedium = theme.textTheme.titleMedium!;
    return Padding(
      padding: EdgeInsets.all(6),
      child: ListTile(
        contentPadding: EdgeInsets.all(2),
        title: Text(
          title,
          style: titleMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle.toUpperCase(),
          style: GoogleFonts.domine(fontSize: 20, color: Colors.red),
          maxLines: 2,
        ),
      ),
    );
  }
}
