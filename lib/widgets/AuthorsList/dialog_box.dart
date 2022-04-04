import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// [ModalPopup] popup that comes when the user clicks on delete
class ModalPopup {
  final Widget childContainer;

  ModalPopup({required this.childContainer});

  void showPopup(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(0.0),
          insetPadding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          content: IntrinsicHeight(
            child: SizedBox(
              width: MediaQueryData.fromWindow(ui.window).size.width * 0.8,
              child: Stack(
                children: [
                  Container(
                    child: childContainer,
                  ),
                  Positioned(
                    right: 5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }
}
