part of 'create_post_bloc.dart';

enum CreatePostStatus { initial, success, failure }

class CreatePostState extends Equatable {
  const CreatePostState({
    this.status = CreatePostStatus.initial,
    this.newPost,
    this.message,
  });

  final CreatePostStatus status;
  final PostEntity? newPost;
  final String? message;

  CreatePostState copyWith({
    CreatePostStatus? status,
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

class CreatePostSuccessState extends CreatePostState{
   final PostEntity? newPost;
   const CreatePostSuccessState({
    this.newPost,
   });
}

class CreatePostErrorState extends CreatePostState{
  final String errorMessage;
  const CreatePostErrorState({
    required this.errorMessage,
  });

}
