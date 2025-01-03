import 'dart:developer';
import 'dart:io';

import 'package:demo_clean_architecture/core/theme/app_colors.dart';
import 'package:demo_clean_architecture/core/utils/image_picker.dart';
import 'package:demo_clean_architecture/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogPage());
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final List<String> selectedList = [];
  File? image;

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              image != null
                  ? GestureDetector(
                      onTap: () async {
                        image = await pickImage();
                        if (image != null) {
                          setState(() {});
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Image.file(image!, fit: BoxFit.cover)),
                      ),
                    )
                  : GestureDetector(
                      onTap: () async {
                        try {
                          image = await pickImage();
                          if (image != null) {
                            setState(() {});
                          }
                        } catch (e) {
                          log(e.toString());
                        }
                      },
                      child: DottedBorder(
                          color: AppPallete.borderColor,
                          dashPattern: const [10, 10],
                          strokeWidth: 2,
                          child: const SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open_rounded,
                                  size: 40,
                                ),
                                SizedBox(height: 10),
                                Text("Select your image")
                              ],
                            ),
                          )),
                    ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["Technology", "Travel", "Food", "Health"]
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (selectedList.contains(e)) {
                                  selectedList.remove(e);
                                } else {
                                  selectedList.add(e);
                                }
                                setState(() {});
                              },
                              child: Chip(
                                backgroundColor: selectedList.contains(e)
                                    ? AppPallete.gradient1
                                    : null,
                                label: Text(e),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlogEditor(hintText: "Blog Title", controller: titleController),
              const SizedBox(
                height: 10,
              ),
              BlogEditor(
                  hintText: "Blog Content", controller: contentController)
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded))
        ],
      ),
    );
  }
}
