import 'package:flutter/material.dart';

class RouterButton extends StatelessWidget {
  const RouterButton({
    Key? key,
    required this.routeName,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String routeName;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.ads_click_outlined),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }
}
