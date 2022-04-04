///[Author] this modal holds all the neccessary fields for the author

class Author {
  Author({
    required this.content,
    required this.updated,
    required this.id,
    required this.author,
    this.isFavourite = false,
  });

  String content;
  DateTime updated;
  int id;
  AuthorDetails author;
  bool isFavourite;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        content: json['content'],
        updated: DateTime.parse(json['updated']),
        id: json['id'],
        author: AuthorDetails.fromJson(json['author']),
        isFavourite: json['isFavourite'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'updated': updated.toIso8601String(),
        'id': id,
        'author': author.toJson(),
        'isFavourite': isFavourite,
      };
}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.photoUrl,
  });

  String name;
  String photoUrl;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json['name'],
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'photoUrl': photoUrl,
      };
}
