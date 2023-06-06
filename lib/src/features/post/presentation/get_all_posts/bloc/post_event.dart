part of 'post_bloc.dart';

class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class PostFetchedEvent extends PostEvent {}

class PostCreatedEvent extends PostEvent {
  final PostEntity newPost;

  const PostCreatedEvent({required this.newPost});

  @override
  List<Object?> get props => [newPost];
}

class PostEditedEvent extends PostEvent {
  final PostEntity editedPost;
  const PostEditedEvent({required this.editedPost});
 @override
  List<Object?> get props => [editedPost];
}

