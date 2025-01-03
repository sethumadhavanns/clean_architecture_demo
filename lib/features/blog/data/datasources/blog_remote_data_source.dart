import 'dart:developer';
import 'dart:io';

import 'package:demo_clean_architecture/features/blog/data/model/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadBlogImage(
      {required File image, required BlogModel blog});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final blogData =
          await supabaseClient.from("blogs").insert(blog.toJson()).select();
      return BlogModel.fromJson(blogData.first);
    } catch (e) {
      log(e.toString(), name: "blogError");
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage(
      {required File image, required BlogModel blog}) async {
    try {
      await supabaseClient.storage.from("blog_images").upload(
            blog.id,
            image,
          );
      return supabaseClient.storage.from("blog_images").getPublicUrl(blog.id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
