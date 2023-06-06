import 'package:equatable/equatable.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

enum EditPostStateStatus { initial, loading, success, failure }

class EditPostState extends Equatable {

  final EditPostStateStatus status;
  final PostEntity? editablePost;
  final String errorMessage;

  const EditPostState({
    this.status = EditPostStateStatus.initial,
    this.editablePost,
    this.errorMessage = '',
  });
  

  EditPostState copyWith({
    EditPostStateStatus? status,
    PostEntity? post,
    String? errorMessage,
  }) {
    return EditPostState(
      status: status ?? this.status,
      editablePost: editablePost ?? this.editablePost,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
   @override
  List<Object?> get props => [status, editablePost, errorMessage];

}
