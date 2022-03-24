class Post {
  String id;
  String? imagePath;
  String? journal;

  Post({
    required this.id,
    this.imagePath,
    this.journal,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as String,
        imagePath: json['imagePath'] as String?,
        journal: json['journal'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'imagePath': imagePath,
        'journal': journal,
      };
}
