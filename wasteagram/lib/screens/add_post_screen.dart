import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/photo_container.dart';
import 'package:wasteagram/widgets/form_and_upload.dart';

class AddPost extends StatelessWidget {
  final String? url;
  const AddPost({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          photoContainer(context, url),
          UploadAndForm(url: url),
        ],   
      ),
    );
  }
}