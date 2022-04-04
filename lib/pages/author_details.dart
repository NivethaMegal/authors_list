import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:author_list/providers/authors_provider.dart';
import 'package:author_list/widgets/AuthorDetails/author_details.dart';

/// [AuthorContent] displays the author details
class AuthorContent extends StatelessWidget {
  const AuthorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map authorDetails = ModalRoute.of(context)?.settings.arguments as Map;
    return Consumer<AuthorsProvider>(
      builder: (context, authorsProvider, _) {
        return AuthorDetailsWidget(
          authorDetails: authorDetails['authorDetails'],
          markFavourite: authorDetails['markFavourite'],
        );
      },
    );
  }
}
