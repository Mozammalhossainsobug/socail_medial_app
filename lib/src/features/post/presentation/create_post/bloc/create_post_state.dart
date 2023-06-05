part of 'create_post_bloc.dart';

enum AddingStatus { initial, success, failure }


class CreatePostState extends Equatable {
  const CreatePostState ({
    this.status = AddingStatus.initial,
    this.id = 1,
    this.userId = 1,
    this.title = '',
    this.body='',
  });

  final AddingStatus status;
  final int id;
  final int userId;
  final String title;
  final String body;

  CreatePostState copyWith({
    AddingStatus? status,
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return CreatePostState(
      status: status ?? this.status,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object?> get props => [status, id, userId, title, body];
}

class CreatePostLoadingState extends CreatePostState{}

class AddingPostState extends CreatePostState {
  const AddingPostState({
    AddingStatus? status,
    int? id,
    int? userId,
    String? title,
    String? body,
  }) : super(
          status: status ?? AddingStatus.initial,
          id: id ?? 1,
          userId: userId ?? 1,
          title: title ?? '',
          body: body ?? '',
        );
}

class CreatePostSuccessState extends CreatePostState{}


class CreatePostErrorState extends CreatePostState{
  final String message;
  const CreatePostErrorState({
    required this.message,
  });

}
