import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/components/navigation.dart';


class UploadAndForm extends StatefulWidget {
  final String? url;
  const UploadAndForm({ Key? key, required this.url}) : super(key: key);

  @override
  State<UploadAndForm> createState() => _UploadAndFormState();
}

class _UploadAndFormState extends State<UploadAndForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int quantity = 0;
  Position? location;
  String? date;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Post')),
      body: Center(
        child: Column(
          children: [
            Form(
              child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantity of Items'
                      ),
                      onSaved: (value){
                        quantity = value as int;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter a number';
                        }
                        return null;
                      },
                  ),
            ),
            FloatingActionButton.large(
              child: const Icon(Icons.cloud_upload),
              backgroundColor: Colors.blue,
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState?.save();
                  date = DateFormat.yMMMMEEEEd().format(DateTime.now());
                }
                FirebaseFirestore.instance.collection('posts').add({
                  'latitude': location!.latitude,
                  'longitude': location!.longitude,
                  'imageURL': widget.url,
                  'date': date
                });
                pushPostsListScreen(context);
              },
            )
          ]
        ),
      ),
    );
  }
}