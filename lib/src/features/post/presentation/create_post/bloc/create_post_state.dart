part of 'create_post_bloc.dart';

enum AddingStatus { initial, success, failure }

class CreatePostState extends Equatable {
  const CreatePostState({
    this.status = AddingStatus.initial,
    this.newPost,
  
  });

  final AddingStatus status;
  final PostEntity? newPost;

  CreatePostState copyWith({
    AddingStatus? status,
    PostEntity? newPost,
  }) {
    return CreatePostState(
      status: status ?? this.status,
      newPost: newPost ?? this.newPost,
    );
  }

  @override
  List<Object?> get props => [status, newPost];
}

class CreatePostLoadingState extends CreatePostState{}

class CreatePostSuccessState extends CreatePostState{}

class CreatePostErrorState extends CreatePostState{
  final String message;
  const CreatePostErrorState({
    required this.message,
  });

}
