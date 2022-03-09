import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/components/navigation.dart';

class UploadButton extends StatefulWidget {
  final String? url;
  final GlobalKey<FormState> formKey;
  const UploadButton({ Key? key, required this.url, required this.formKey}) : super(key: key);

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {

  late Position location;
  late String date;

  @override
  void initState(){
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async{
    location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      child: const Icon(Icons.cloud_upload),
      backgroundColor: Colors.blue,
      onPressed: () {
        if(widget.formKey.currentState!.validate()){
          widget.formKey.currentState?.save();
          date = DateFormat.yMMMMEEEEd().format(DateTime.now());
        }
        FirebaseFirestore.instance.collection('posts').add({
          'latitude': location.latitude,
          'longitude': location.longitude,
          'imageURL': widget.url,
          'date': date
        });
        pushPostsListScreen(context);
      },
    );
  }
}