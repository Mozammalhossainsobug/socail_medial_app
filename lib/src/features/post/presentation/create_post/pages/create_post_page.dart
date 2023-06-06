import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_event.dart';
import 'package:socail_medial_app/src/features/post/presentation/get_all_posts/bloc/post_bloc.dart';
import 'package:socail_medial_app/src/features/post/root/domain/entities/post_entity.dart';

class CreatePostPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final int num = 1;

  CreatePostPage({Key? key}) : super(key: key);

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
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            Navigator.pop(context);
          }
          if (state is CreatePostSuccessState) {
            context.read<PostBloc>().add(PostCreatedEvent(newPost: state.newPost!));

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post successfully created')));
             _titleController.clear();
             _bodyController.clear();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Tittle';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                      height:
                          20.0), // This gives more space between the title and description fields.
                  TextFormField(
                    controller: _bodyController,
                    maxLines: 5,
                    textAlign: TextAlign
                        .start, // This makes the field expand as more lines are added.
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      fillColor: Colors.white,
                      alignLabelWithHint: true,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final newPost = PostEntity(
                              userId: 1,
                              id: 1,
                              title: _titleController.text,
                              body: _bodyController.text,
                              );
                         // print(newPost.body);
                          BlocProvider.of<CreatePostBloc>(context).add(CreatedPostEvent(newPost: newPost,));
                          
                        }
                      },
                      child: state is CreatePostLoadingState
                          ? const CircularProgressIndicator()
                          : const Text('Create Post'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
