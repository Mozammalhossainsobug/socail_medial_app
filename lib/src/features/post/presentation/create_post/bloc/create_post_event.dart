part of 'create_post_bloc.dart';

class CreatePostEvent{}

class AddPostEvent extends CreatePostEvent {
  final int id;
  final int userId;
  final String title;
  final String body;

  AddPostEvent({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}


