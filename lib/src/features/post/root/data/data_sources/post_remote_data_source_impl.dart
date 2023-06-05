import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:socail_medial_app/src/features/post/root/data/data_sources/post_remote_data_source.dart';
import 'package:socail_medial_app/src/features/post/root/data/models/post_model.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

class PostRemoteDataSourceImp implements PostRemoteDataSource {
  var client = http.Client();

  @override
  Future<Response> addPosts(PostEntity post) async {
    var client = http.Client();

    final response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5'),
        body: jsonEncode(
          post.toJson(),
        ));
    return response;
  }

  @override
  Future<Unit> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<http.Response> getAllPosts() async {
    var client = http.Client();
    var response = await client.get(
            Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=5',
      ),

    );

    return response;
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
