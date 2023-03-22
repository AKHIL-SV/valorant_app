import 'package:flutter/material.dart';

class AbilityTile extends StatelessWidget {
  final String title, subtitle, logourl;
  const AbilityTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.logourl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      minVerticalPadding: 12,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      tileColor: const Color(0xff19273c),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xff3a4755),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(logourl), fit: BoxFit.fitWidth),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 10,
          wordSpacing: 2,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
