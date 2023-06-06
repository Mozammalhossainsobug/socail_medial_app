import 'package:dartz/dartz.dart';
import 'package:socail_medial_app/src/features/post/root/data/repositories/post_repository_impl.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

class EditPostsUseCase{
  final PostRepositoryIml postRepository = PostRepositoryIml();

  Future<Either<String, PostEntity>> call(PostEntity post) async{
    return await postRepository.updatePosts(post);
  }
}
