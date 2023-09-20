import 'package:cleaarchapp/features/Posts/Presentaion/Blocs/bloc/add_delete_bloc.dart';
import 'package:cleaarchapp/features/Posts/Presentaion/Blocs/bloc/get_all_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AddPostScreen.dart';

class ShowPostsScreen extends StatefulWidget {
  const ShowPostsScreen({super.key, required this.title});

  final String title;

  @override
  State<ShowPostsScreen> createState() => _ShowPostsScreenState();
}

class _ShowPostsScreenState extends State<ShowPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.read<GetAllPostsBloc>()..add(GetAllPostsEvent());
              },
              icon: Icon(Icons.refresh),
            )
          ],
          backgroundColor: Colors.indigo,
          title: Text(
            "All Posts",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocListener<AddDeleteBloc, AddDeleteState>(
          listener: (context, state) {
            if (state is SuccessfullState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  actionOverflowThreshold: 0,
                  content: Container(
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  actionOverflowThreshold: 0,
                  content: Container(
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      state.msg,
                      style: TextStyle(color: Colors.white),
                    ),
                  )));
            }
          },
          child: SafeArea(
              child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: BlocBuilder<GetAllPostsBloc, GetAllPostsState>(
                    bloc: context.read<GetAllPostsBloc>()
                      ..add(GetAllPostsEvent()),
                    builder: (context, state) {
                      if (state is GetAllPostsLoading) {
                        return Center(
                          child:
                              CircularProgressIndicator(color: Colors.indigo),
                        );
                      }
                      if (state is LoadingErrorState) {
                        return Center(
                          child: Text(
                            state.msg,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      if (state is GetAllPostsLoaded) {
                        return ListView.builder(
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ActionChip(
                                      label: Text('add'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              BlocProvider.value(
                                            value:
                                                context.read<AddDeleteBloc>(),
                                            child: AddPostScreen(),
                                          ),
                                        ));
                                      }),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.indigo)),
                                    child: ListTile(
                                      title: Text(state.posts[index].title!),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () async {
                                          context.read<AddDeleteBloc>().add(
                                              DeleteEvent(
                                                  state.posts[index].id!));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      }
                      return SizedBox();
                    },
                  ))),
        ));
  }
}
