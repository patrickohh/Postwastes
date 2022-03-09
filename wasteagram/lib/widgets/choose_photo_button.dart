import 'package:flutter/material.dart';
import 'package:wasteagram/components/navigation.dart';

Widget choosePhotoButton(BuildContext context){
  return FloatingActionButton(
    onPressed: (){
      pushChoosePhotoScreen(context);
    },
    backgroundColor: Colors.blue,
    child: const Icon(Icons.camera_alt),
  );
}