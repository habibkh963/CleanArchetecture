import 'package:cleaarchapp/features/Posts/Domain/entites/Posts.dart';

class PostsModel extends Posts {
  PostsModel({super.userId, super.id, super.title, super.body});

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = super.userId;
    data['id'] = super.id;
    data['title'] = super.title;
    data['body'] = super.body;
    return data;
  }
}
