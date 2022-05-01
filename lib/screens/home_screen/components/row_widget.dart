import 'package:flutter/material.dart';

class RowWidget {
  static Card customerRow({
    required String profile,
    required String titleName,
    required String companyName,
    required Function() onTap,
  }) {
    return Card(
        child: GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: profile.isEmpty
            ? const Icon(Icons.error)
            : CircleAvatar(
                backgroundImage: NetworkImage(
                  profile,
                ),
              ),
        title: Text(titleName + '\n' + companyName),
      ),
    ));
  }
}
