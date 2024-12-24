import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Center(child: Text("Blog App", textAlign: TextAlign.center)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.add_circled))
        ],
      ),
    );
  }
}
