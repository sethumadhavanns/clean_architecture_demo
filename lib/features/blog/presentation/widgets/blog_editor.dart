import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const BlogEditor(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      controller: controller,
    );
  }
}
