import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_event.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_state.dart';
import 'package:socail_medial_app/src/features/post/presentation/get_all_posts/bloc/post_bloc.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

class EditPostPage extends StatefulWidget {
  final PostEntity editablePost;
  const EditPostPage({Key? key, required this.editablePost}) : super(key: key);

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.editablePost.title;
    _bodyController.text = widget.editablePost.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: BlocConsumer<EditPostBloc, EditPostState>(
        listener: (context, state) {
           if (state.status == EditPostStateStatus.success) {
            context.read<PostBloc>().add(PostEditedEvent(editedPost: state.editablePost!));
           Navigator.pop(context);
          } 
          else if (state.status == EditPostStateStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == EditPostStateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
                const SizedBox(height: 16.0),
                TextField(
                  maxLines: null,
                  controller: _bodyController,
                  decoration: const InputDecoration(
                    labelText: 'Body',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    final title = _titleController.text;
                    final body = _bodyController.text;
                    final editedPost = PostEntity(
                      userId: widget.editablePost.userId,
                      id: widget.editablePost.id,
                      title: title,
                      body: body,
                    );
                    BlocProvider.of<EditPostBloc>(context).add(EditedEvent(editedPost));
                  },
                  child: const Text('Edit Post'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
