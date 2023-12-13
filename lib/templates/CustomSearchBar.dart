import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Colors.white,
          textDirection: null,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).primaryColorLight),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(99, 255, 255, 255)),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
      ),
    );
  }
}
