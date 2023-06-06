import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      emit(state.copyWith(status: EditPostStateStatus.loading));
      await editPostUseCase.call(event.editablePost);
      emit(state.copyWith(
          status: EditPostStateStatus.success, post: event.editablePost));
    } catch (error) {
      emit(state.copyWith(
        status: EditPostStateStatus.failure,
        errorMessage: 'Failed to add post.',
      ));
    }
  }
}
