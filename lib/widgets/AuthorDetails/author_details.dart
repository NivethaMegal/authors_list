import 'package:flutter/material.dart';

import 'package:author_list/model/authors.dart';

/// [AuthorDetailsWidget] used to display all the details of the author
class AuthorDetailsWidget extends StatelessWidget {
  final Author authorDetails;
  final Function markFavourite;

  const AuthorDetailsWidget({
    Key? key,
    required this.authorDetails,
    required this.markFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple.shade500,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () => markFavourite(authorDetails.id),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32 / 2),
                  color: Colors.white,
                ),
                child: Image.asset(
                  authorDetails.isFavourite
                      ? 'assets/images/selected_favourites.png'
                      : 'assets/images/favourites.png',
                  width: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                authorDetails.author.photoUrl,
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              authorDetails.author.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              authorDetails.content,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
