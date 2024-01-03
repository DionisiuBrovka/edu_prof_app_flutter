import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.controller, required this.onTextChanged});

  final Function(String)? onTextChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onChanged: onTextChanged,
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
