import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_event.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/create_post_use_case.dart';

part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostUseCase createPostUseCase;

  CreatePostBloc({
    required this.createPostUseCase,
  }) : super(const CreatePostState()) {
    on<CreatedPostEvent>(_onCreatedPostEvent);
  }

  Future<void> _onCreatedPostEvent(
    CreatedPostEvent event,
    Emitter<CreatePostState> emit,
  ) async {
    emit(const CreatePostState());
    try {
      final PostEntity newPost = event.newPost;
      final response = await createPostUseCase.call(newPost);
      response.fold(
        (failure) => emit(CreatePostErrorState(errorMessage: failure.toString())),
        (newPost) {
          emit(CreatePostSuccessState(newPost: newPost));
        },
      );
    } catch (e) {
      emit(CreatePostErrorState(errorMessage: e.toString()));
    }
  }
}
