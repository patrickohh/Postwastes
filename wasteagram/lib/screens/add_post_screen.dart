import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/photo_container.dart';
import 'package:wasteagram/widgets/form_and_upload.dart';

class AddPost extends StatelessWidget {
  final String? url;
  const AddPost({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Wasteagram')
      ),
      body: Center(
        child: Column(
          children: [
            photoContainer(context, url),
            UploadAndForm(url: url),
          ],   
        ),
      ),
    );
  }
}