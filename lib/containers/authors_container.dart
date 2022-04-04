import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';

import 'package:author_list/model/authors.dart';
import 'package:author_list/services/author_services.dart';
import 'package:author_list/providers/authors_provider.dart';
import 'package:author_list/widgets/AuthorsList/dialog_box.dart';
import 'package:author_list/widgets/AuthorsList/dialog_modal.dart';
import 'package:author_list/widgets/AuthorsList/authors_list_widget.dart';

/// [AuthorsContainer] container that holds the logic for
/// search, delete, favourite actions of the authors list
class AuthorsContainer extends StatefulWidget {
  const AuthorsContainer({Key? key}) : super(key: key);

  @override
  State<AuthorsContainer> createState() => _AuthorsContainerState();
}

class _AuthorsContainerState extends State<AuthorsContainer> {
  late AuthorsProvider authorsProvider;
  late List<Author> updatedAuthorList = [];
  @override
  void initState() {
    authorsProvider = Provider.of<AuthorsProvider>(context, listen: false);
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      // get the authors list from mock json
      authorsProvider.setAuthorsList = await AuthorServices().getAuthorsData();
      // update the list
      setState(() {
        updatedAuthorList = authorsProvider.authorsList.values.toList();
      });
    });
    super.initState();
  }

  /// [calculateYears] calculate the years
  int calculateYears(DateTime updatedYear) {
    return DateTime.now().year - updatedYear.year;
  }

  /// [deleteAuthor] to delete the author from the list
  void deleteAuthor(int authorId) {
    authorsProvider.authorsList.remove(authorId);
    authorsProvider.setAuthorsList = authorsProvider.authorsList;
    setState(() {
      updatedAuthorList = authorsProvider.authorsList.values.toList();
    });
    Navigator.pop(context);
  }

  /// [showDeleteAuthorDialog] to show the dialog for deleting author
  void showDeleteAuthorDialog(int authorId) {
    ModalPopup(
      childContainer: Padding(
        padding: const EdgeInsets.all(20),
        child: AuthorsDeleteModal(
          authorId: authorId,
          deleteAuthor: deleteAuthor,
          image: authorsProvider.authorsList[authorId]?.author.photoUrl ?? '',
          name: authorsProvider.authorsList[authorId]?.author.name ?? '',
          updated: calculateYears(
            authorsProvider.authorsList[authorId]?.updated ?? DateTime.now(),
          ),
        ),
      ),
    ).showPopup(context);
  }

  /// [makeFavouriteAuthor] make the author as favourite
  void makeFavouriteAuthor(int authorId) {
    if (authorsProvider.authorsList[authorId]?.isFavourite ?? false) {
      authorsProvider.authorsList[authorId]?.isFavourite = false;
    } else {
      authorsProvider.authorsList[authorId]?.isFavourite = true;
    }
    authorsProvider.setAuthorsList = authorsProvider.authorsList;
  }

  /// [searchAuthor] searching the author with query entered by the user
  void searchAuthor(String query) {
    final searchList = authorsProvider.authorsList.values
        .toList()
        .where((author) =>
            author.author.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      updatedAuthorList = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthorsProvider>(builder: (context, authorsProvider, _) {
      if (authorsProvider.authorsList.isNotEmpty) {
        return AuthorsListWidget(
          authorsList: updatedAuthorList,
          markFavourite: makeFavouriteAuthor,
          calculateYears: calculateYears,
          showDeleteAuthorDialog: showDeleteAuthorDialog,
          searchAuthor: searchAuthor,
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
