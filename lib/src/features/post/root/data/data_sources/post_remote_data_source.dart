
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:socail_medial_app/src/features/post/root/data/models/post_model.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

abstract class PostRemoteDataSource {
  Future<Response> getAllPosts();

  Future<Unit> deletePost(int postId);

  Future<Unit> updatePost(PostModel postModel);

  Future<Response> addPosts(PostEntity postEntity);
}