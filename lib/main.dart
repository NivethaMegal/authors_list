import 'package:author_list/providers/authors_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:author_list/pages/authors.dart';
import 'package:author_list/pages/author_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthorsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Authors List',
        routes: {
          '/author_details': (BuildContext context) => const AuthorContent()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MaterialApp(
          builder: (context, child) {
            return const Authors();
          },
        ),
      ),
    );
  }
}
