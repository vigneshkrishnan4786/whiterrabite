import 'package:flutter/material.dart';

class SearchWidget {
  static Container searchHeader(
      {required TextEditingController search,
      required BuildContext context,
      required Function(String) onChangedText,
      required Function() onclear}) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.search),
            title: TextField(
              controller: search,
              decoration: const InputDecoration(
                  hintText: 'Search', border: InputBorder.none),
              onChanged: onChangedText,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: onclear,
            ),
          ),
        ),
      ),
    );
  }
}
