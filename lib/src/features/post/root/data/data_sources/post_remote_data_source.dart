
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

abstract class PostRemoteDataSource {
  Future<Response> getAllPosts();

  Future<Unit> deletePost(int postId);

  Future<Response> updatePost(PostEntity post);

  Future<Response> addPosts(PostEntity postEntity);
}