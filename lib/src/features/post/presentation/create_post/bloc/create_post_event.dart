import 'package:equatable/equatable.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';


class CreatePostEvent  extends Equatable {
  const CreatePostEvent();
  
  @override
  List<Object?> get props => [];
}


class CreatedPostEvent extends CreatePostEvent {
  final PostEntity newPost;

  const CreatedPostEvent({
    required this.newPost,
  });
    @override
  List<Object> get props => [newPost];

}

