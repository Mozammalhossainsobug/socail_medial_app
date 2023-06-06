import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_event.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_state.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/edit_post_use_case.dart';

class EditPostBloc extends Bloc<EditPostEvent, EditPostState> {
  final EditPostsUseCase editPostUseCase;

  EditPostBloc({required this.editPostUseCase}) : super(const EditPostState()) {
    on<EditedEvent>(_onEditedEvent);
  }

  FutureOr<void> _onEditedEvent(
    EditedEvent event,
    Emitter<EditPostState> emit,
  ) async {
    try {
      final PostEntity editedPost = event.editablePost;
      final response = await editPostUseCase.call(editedPost);
      response.fold(
        (l) => emit(
          state.copyWith(
            status: EditPostStateStatus.failure,
            errorMessage: l.toString(),
          ),
        ),
        (r) {
          print("success from edit post bloc");
          emit(
            state.copyWith(
              status: EditPostStateStatus.success,
              post: r,
            ),
          );
        },
      );
    } catch (e) {
      emit(EditPostState(errorMessage: e.toString()));
    }
  }
}
