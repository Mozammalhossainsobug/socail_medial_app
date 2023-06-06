import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/pages/create_post_page.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_state.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/pages/edit_post_page.dart';
import 'package:socail_medial_app/src/features/post/presentation/get_all_posts/bloc/post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/get_all_posts/widgets/post_card.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late PostBloc _postBloc;
  late CreatePostBloc _createPostBloc;
  late EditPostBloc _editPostBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = context.read<PostBloc>();
    _createPostBloc = context.read<CreatePostBloc>();
    _editPostBloc = context.read<EditPostBloc>();
    _postBloc.add(PostFetchedEvent());
  }

  @override
  void dispose() {
    _postBloc.close();
    _createPostBloc.close();
    _editPostBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return BlocListener<CreatePostBloc, CreatePostState>(
            listener: (context, createPostState) {
              if (createPostState.status == CreatePostStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            child: BlocListener<EditPostBloc, EditPostState>(
              listener: (context, editPostState) {
                if (editPostState.status == EditPostStateStatus.failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(editPostState.errorMessage),
                    ),
                  );
                }
              },
              child: _buildPostsList(state),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildPostsList(PostState state) {
    if (state.status == PostStatus.initial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.status == PostStatus.failure) {
      return Text(state.errorMessage);
    } else if (state.status == PostStatus.success) {
      return ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          final post = state.posts[index];
          return GestureDetector(
            onTap: ()=> {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditPostPage(editablePost: post,)),
          )   
            },
            child: PostCard(
              index: index + 1,
              postEntity: post,
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
