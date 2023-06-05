part of 'create_post_bloc.dart';

abstract class CreatePostEvent{}

class AddPostEvent extends CreatePostEvent {
  PostEntity newPost;

  AddPostEvent({
    required this.newPost,
  });
}

