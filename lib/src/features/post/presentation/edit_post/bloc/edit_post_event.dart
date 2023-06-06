import 'package:equatable/equatable.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

class EditPostEvent extends Equatable {
  const EditPostEvent();

  @override
  List<Object> get props => [];
}


class EditedEvent extends EditPostEvent {
  
  final PostEntity editablePost;

  const EditedEvent(this.editablePost);

  @override
  List<Object> get props => [editablePost];
}