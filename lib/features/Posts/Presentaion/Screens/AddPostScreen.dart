import 'package:cleaarchapp/features/Posts/Domain/entites/Posts.dart';
import 'package:cleaarchapp/features/Posts/Presentaion/Blocs/bloc/add_delete_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController uid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Add Post'),
      ),
      body: BlocListener<AddDeleteBloc, AddDeleteState>(
        bloc: context.read<AddDeleteBloc>(),
        listener: (context, state) {
          if (state is ErrorState) {
            print(state.msg);
          }
          if (state is SuccessfullState) {
            print('succseful');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(label: Text('title')),
                  ),
                  TextFormField(
                    controller: body,
                    decoration: InputDecoration(label: Text('body')),
                  ),
                  TextFormField(
                    controller: id,
                    decoration: InputDecoration(label: Text('id')),
                  ),
                  TextFormField(
                    controller: uid,
                    decoration: InputDecoration(label: Text('Uid')),
                  ),
                  ActionChip(
                      onPressed: () async {
                        context.read<AddDeleteBloc>().add(AddEvent(Posts(
                            body: body.text,
                            title: title.text,
                            id: int.parse(id.text.trim()),
                            userId: int.parse(uid.text.trim()))));
                      },
                      label: Text('send'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
