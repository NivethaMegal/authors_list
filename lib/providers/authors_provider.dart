import 'package:flutter/material.dart';

import 'package:author_list/model/authors.dart';

/// [AuthorsProvider] this provider will have the list of the authors
class AuthorsProvider extends ChangeNotifier {
  Map<int, Author> authorsList = {};

  set setAuthorsList(Map<int, Author> authors) {
    authorsList = authors;
    notifyListeners();
  }

  get getAuthorsList {
    return authorsList;
  }
}
