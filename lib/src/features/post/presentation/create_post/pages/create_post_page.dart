import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_bloc.dart';

class CreatePostPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: BlocConsumer<CreatePostBloc, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is CreatePostSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Post successfully created')));
            _titleController.clear();
            _bodyController.clear();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: _bodyController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CreatePostBloc>().add(AddPostEvent(
                          userId: 1,
                          id : 1,
                          title: _titleController.text,
                          body: _bodyController.text,
                        ));
                  },
                  child: state is CreatePostLoadingState
                      ? const CircularProgressIndicator()
                      : const Text('Create Post'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
