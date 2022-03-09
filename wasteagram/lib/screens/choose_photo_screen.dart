import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/screens/add_post_screen.dart';

class ChoosePhoto extends StatefulWidget {
  const ChoosePhoto({ Key? key }) : super(key: key);

  @override
  State<ChoosePhoto> createState() => _ChoosePhotoState();
}

class _ChoosePhotoState extends State<ChoosePhoto> {

  File? image;

  String? url;

  final picker = ImagePicker();

  final date = DateTime.now();

  Future getAndUploadImage(bool isGallery) async{
    if(isGallery){
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      image = File(pickedFile!.path);
      Reference storageReference = FirebaseStorage.instance.ref().child(date.toString());
      UploadTask uploadTask = storageReference.putFile(image!); 
      await uploadTask.whenComplete(() async {
        url = await storageReference.getDownloadURL();
        setState(() {});
      });
    }
    else{
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      image = File(pickedFile!.path);
      Reference storageReference = FirebaseStorage.instance.ref().child(date.toString());
      UploadTask uploadTask = storageReference.putFile(image!); 
      await uploadTask.whenComplete(() async{
        url = await storageReference.getDownloadURL();
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                getAndUploadImage(true);
                AddPost(url: url);
              }, 
              child: const Text('Photo Gallery')
            ),
            ElevatedButton(
              onPressed: (){
                getAndUploadImage(false);
                AddPost(url: url);
              }, 
              child: const Text('Camera')
            )
          ],
        ),
    );
  }
}



