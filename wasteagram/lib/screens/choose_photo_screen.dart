import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/components/navigation.dart';
import 'package:wasteagram/screens/add_post_screen.dart';

class ChoosePhoto extends StatefulWidget {
  const ChoosePhoto({ Key? key }) : super(key: key);

  @override
  State<ChoosePhoto> createState() => _ChoosePhotoState();
}

class _ChoosePhotoState extends State<ChoosePhoto> {

  final picker = ImagePicker();

  final date = DateTime.now();

  File? image;

  String? url;

  Future getAndUploadImage(bool isGallery) async{
    if(isGallery){

      final date = DateTime.now();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      image = File(pickedFile!.path);

      var fileName = date.toString() + '.jpg';
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putFile(image!);
      await uploadTask;
      final retrievedImageURL = await storageReference.getDownloadURL();
      setState(() {
        url = retrievedImageURL;
      });
      pushAddPostScreen(context, url);
    }
    else{

      final date = DateTime.now();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      image = File(pickedFile!.path);

      var fileName = date.toString() + '.jpg';
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putFile(image!);
      await uploadTask;
      final retrievedImageURL = await storageReference.getDownloadURL();
      setState(() {
        url = retrievedImageURL;
      });
      pushAddPostScreen(context, url);
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
              }, 
              child: const Text('Photo Gallery')
            ),
            ElevatedButton(
              onPressed: (){
                getAndUploadImage(false);
              }, 
              child: const Text('Camera')
            )
          ],
        ),
    );
  }
}


