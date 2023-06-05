import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/create_post_use_case.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc({required this.createPost}) : super(CreatePostState()) {
    on<AddPostEvent>(_onAddPostEvent);
  }

  final CreatePosts createPost;

  Future<void> _onAddPostEvent(
    AddPostEvent event,
    Emitter<CreatePostState> emit,
  ) async {
    emit(const CreatePostState());
    try {
      final post = PostEntity(id: event.id, title: event.title, body: event.body, userId: event.userId);

      if(post.body == '' || post.title == ''){
        throw('Invalid parameters. All parameters must be non-null.');
      }
      final response = await createPost.call(post);

      response.fold(
        (failure) => emit(CreatePostErrorState(message: failure.toString())),
        (_) => emit(CreatePostSuccessState()),
      );
    } catch (e) {
      emit(CreatePostErrorState(message: e.toString()));
    }
  }
}
