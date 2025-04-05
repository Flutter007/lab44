import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const CustomTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.yellowAccent, Colors.orangeAccent],
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(title, style: theme.textTheme.titleMedium),
      ),
    );
  }
}
