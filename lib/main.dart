import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_medial_app/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:socail_medial_app/src/features/login/presentation/pages/login_page.dart';
import 'package:socail_medial_app/src/features/post/presentation/create_post/bloc/create_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/edit_post/bloc/edit_post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/get_all_posts/bloc/post_bloc.dart';
import 'package:socail_medial_app/src/features/post/presentation/get_all_posts/pages/post_page.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/create_post_use_case.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/edit_post_use_case.dart';
import 'package:socail_medial_app/src/features/post/root/domain/use_cases/get_all_posts_use_case.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => PostBloc(getAllPosts: GetAllPosts())),
        BlocProvider(create: (_) => CreatePostBloc(createPostUseCase: CreatePostUseCase() )),
        BlocProvider(create: (_) => EditPostBloc(editPostUseCase: EditPostsUseCase()),),
      ],
      child: MaterialApp(
        title: 'Social Media',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const PostPage(),
      ),
    );
  }
}
