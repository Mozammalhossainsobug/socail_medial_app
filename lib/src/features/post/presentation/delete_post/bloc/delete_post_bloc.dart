import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  DeletePostBloc() : super(DeletePostInitial()) {
    on<DeletePostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
