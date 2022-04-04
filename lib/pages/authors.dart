import 'package:flutter/material.dart';

import 'package:author_list/containers/authors_container.dart';

/// [Authors] displays all the authors list available for the user
class Authors extends StatelessWidget {
  const Authors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthorsContainer();
  }
}
