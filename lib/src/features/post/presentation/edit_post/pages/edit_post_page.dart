import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_event.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

class EditPostPage extends StatefulWidget {
  final PostEntity editablePost;
  const EditPostPage({super.key, required this.editablePost});

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
      body: Padding(
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

                    BlocProvider.of<EditPostBloc>(context)
                         .add(EditedEvent(editedPost));
                    Navigator.pop(context);
                  },
                  child: const Text('Edit Post'),
                ),
              ],
            ),
          ),
    );
  }
}
