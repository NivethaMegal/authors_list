import 'package:flutter/material.dart';

import 'package:author_list/model/authors.dart';
import 'package:author_list/widgets/common/author_name.dart';
import 'package:author_list/widgets/common/outline_button.dart';

/// [AuthorsListWidget] used to render the list of the authors in list view builder
/// with the search bar
class AuthorsListWidget extends StatefulWidget {
  final List<Author> authorsList;
  final Function markFavourite;
  final Function calculateYears;
  final Function showDeleteAuthorDialog;
  final Function searchAuthor;
  const AuthorsListWidget({
    Key? key,
    this.authorsList = const [],
    required this.markFavourite,
    required this.calculateYears,
    required this.showDeleteAuthorDialog,
    required this.searchAuthor,
  }) : super(key: key);

  @override
  State<AuthorsListWidget> createState() => _AuthorsListWidgetState();
}

class _AuthorsListWidgetState extends State<AuthorsListWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors List'),
        backgroundColor: Colors.purple.shade500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.purple,
                    ),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.purple[50],
                    filled: true,
                  ),
                  style: const TextStyle(color: Colors.purple),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    widget.searchAuthor(value);
                  },
                  key: const ValueKey('search'),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${widget.authorsList.length} authors found',
                  style: const TextStyle(color: Colors.purple),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.authorsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      '/author_details',
                      arguments: {
                        'authorDetails': widget.authorsList[index],
                        'markFavourite': widget.markFavourite,
                      },
                    ),
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.purple.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AuthorName(
                                name: widget.authorsList[index].author.name,
                                image:
                                    widget.authorsList[index].author.photoUrl,
                                updated: widget.calculateYears(
                                    widget.authorsList[index].updated),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => widget
                                  .markFavourite(widget.authorsList[index].id),
                              child: Image.asset(
                                widget.authorsList[index].isFavourite
                                    ? 'assets/images/selected_favourites.png'
                                    : 'assets/images/favourites.png',
                                width: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            OutlineButtonCTA(
                              onClick: widget.showDeleteAuthorDialog,
                              authorId: widget.authorsList[index].id,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
