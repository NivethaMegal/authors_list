import 'package:flutter/material.dart';

import 'package:author_list/widgets/common/author_name.dart';
import 'package:author_list/widgets/common/outline_button.dart';

/// [AuthorsDeleteModal] confiration popup content of the author when user tries to delete
class AuthorsDeleteModal extends StatelessWidget {
  final String name;
  final String image;
  final int updated;
  final Function deleteAuthor;
  final int authorId;
  const AuthorsDeleteModal({
    Key? key,
    required this.name,
    required this.image,
    required this.updated,
    required this.deleteAuthor,
    required this.authorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delete this author ?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        AuthorName(
          name: name,
          image: image,
          updated: updated,
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomRight,
          child: OutlineButtonCTA(
            onClick: deleteAuthor,
            authorId: authorId,
          ),
        ),
      ],
    );
  }
}
