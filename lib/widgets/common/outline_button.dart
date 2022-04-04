import 'package:flutter/material.dart';

/// [OutlineButtonCTA] Delete CTA for deleting the author
class OutlineButtonCTA extends StatelessWidget {
  final Function onClick;
  final int authorId;
  const OutlineButtonCTA({
    Key? key,
    required this.onClick,
    required this.authorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onClick(authorId),
      child: const Text(
        'Delete',
        style: TextStyle(color: Colors.purple),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.purple.shade100;
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            return const BorderSide(
              color: Colors.purple,
            );
          },
        ),
      ),
    );
  }
}
