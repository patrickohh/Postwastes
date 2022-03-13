import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/choose_photo_button.dart';

Widget loadingBar(BuildContext context) {
  return Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: const CircularProgressIndicator(),
              alignment: Alignment.center
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: choosePhotoButton(context),
            ),
          )
        ],
    ),
  );
}