import 'package:cleaarchapp/InjectionContainer.dart';
import 'package:cleaarchapp/features/Posts/Presentaion/Blocs/bloc/add_delete_bloc.dart';
import 'package:cleaarchapp/features/Posts/Presentaion/Blocs/bloc/get_all_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/Posts/Presentaion/Screens/ShowPostsScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependecy_init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => dependcy<GetAllPostsBloc>(),
        ),
        BlocProvider<AddDeleteBloc>(
          create: (context) => dependcy<AddDeleteBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => dependcy<GetAllPostsBloc>(),
            ),
            BlocProvider<AddDeleteBloc>(
              create: (context) => dependcy<AddDeleteBloc>(),
            ),
          ],
          child: ShowPostsScreen(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
