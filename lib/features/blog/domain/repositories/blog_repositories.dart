import 'dart:io';

import 'package:demo_clean_architecture/core/error/failure.dart';
import 'package:demo_clean_architecture/features/blog/domain/entities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String posterId,
    required List<String> topics,
    required String blogTitle,
    required String blogContent,
  });
}
