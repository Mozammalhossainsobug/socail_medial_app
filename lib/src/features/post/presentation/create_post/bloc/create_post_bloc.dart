import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_event.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/create_post_use_case.dart';


part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc({required this.createPost}) : super(const CreatePostState()) {
    on<CreatedPostEvent>(_onAddPostEvent);
  }

  final CreatePosts createPost;


  Future<void> _onAddPostEvent(
    CreatedPostEvent event,
    Emitter<CreatePostState> emit,
  ) async {
    emit(const CreatePostState());
    try {
      final PostEntity newPost = event.newPost;
      final response = await createPost.call(newPost);
      response.fold(
        (failure) => emit(CreatePostErrorState(message: failure.toString())),
        (_) => emit(CreatePostSuccessState(newPost: newPost)),
      );
    } catch (e) {
      emit(CreatePostErrorState(message: e.toString()));
    }
  }
}