part of 'create_post_bloc.dart';

enum CreatePostStatus { initial, success, failure }

class CreatePostState extends Equatable {
  const CreatePostState({
    this.status = CreatePostStatus.initial,
    this.newPost,
  
  });

  final CreatePostStatus status;
  final PostEntity? newPost;

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
  final String message;
  const CreatePostErrorState({
    required this.message,
  });

}
