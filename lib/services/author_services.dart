import 'dart:convert';

import 'package:author_list/model/authors.dart';

import 'package:flutter/services.dart' as bundle;

/// [AuthorServices] used to get the authors list from mock json
class AuthorServices {
  Future<Map<int, Author>> getAuthorsData() async {
    Map<int, Author> authorsList = {};
    //read json file
    final jsondata = await bundle.rootBundle.loadString('mock/author.json');
    //decode json data as list
    final List list = json.decode(jsondata)['messages'];
    for (var element in list) {
      Author authorData = Author.fromJson(element);
      authorsList.putIfAbsent(authorData.id, () => authorData);
    }
    //map json and initialize using DataModel
    return authorsList;
  }
}
