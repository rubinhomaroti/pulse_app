import 'package:uuid/uuid.dart';

import 'post.dart';

class Patient {
  String id;
  String? name;
  double? weight;
  String? city;
  String? state;
  String? avatar;
  String? disease;
  List<String>? activities;
  List<Post>? posts;
  List<Patient>? friends;

  Patient({
    required this.id,
    this.name,
    this.weight,
    this.city,
    this.state,
    this.avatar,
    this.disease,
    this.activities,
    this.posts,
    this.friends,
  });

  bool hasFriends() => friends != null && friends!.isNotEmpty;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'] as String,
        name: json['name'] as String?,
        weight: json['weight'] as double?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        avatar: json['avatar'] as String?,
        disease: json['disease'] as String?,
        activities: json['activities'] as List<String>?,
        posts: json['posts'] as List<Post>?,
        friends: (json['friends'] as List<dynamic>?)?.map((e) => Patient.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'weight': weight,
        'city': city,
        'state': state,
        'avatar': avatar,
        'disease': disease,
        'activities': activities,
        'friends': friends,
      };

  void addImagePost(String? path) {
    posts ??= [];
    posts!.add(Post(id: const Uuid().v4(), imagePath: path));
  }

  void addJournalPost(String? journal) {
    posts ??= [];
    posts!.add(Post(id: const Uuid().v4(), journal: journal));
  }
}
