import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/components/navigation.dart';
import 'package:wasteagram/models/post_class.dart';


class UploadAndForm extends StatefulWidget {
  final String? url;
  const UploadAndForm({ Key? key, required this.url}) : super(key: key);

  @override
  State<UploadAndForm> createState() => _UploadAndFormState();
}

class _UploadAndFormState extends State<UploadAndForm> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Form(
                key: formKey,
                child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Quantity of Items'
                                    ),
                                    onSaved: (value){
                                      quantity = int.parse(value!);
                                    },
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return 'Enter a number';
                                      }else{
                                        return null;
                                      }
                                    }
                                  ),
                          )
              ),
              Semantics(
                button: true,
                enabled: true,
                onTapHint: 'Tap to Upload post to database',
                child: FloatingActionButton.large(
                      child: const Icon(Icons.cloud_upload),
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          formKey.currentState?.save();
                          date = DateFormat.yMMMMEEEEd().format(DateTime.now());
                          Posts newPost = Posts(date: date, 
                                                longitude: location!.longitude, 
                                                latitude: location!.latitude, 
                                                imageURL: widget.url,
                                                quantity: quantity,
                                                id: Timestamp.now());
                                                newPost.addPost();
                          pushPostsListScreen(context);
                        }
                      },
                ),
              )
          ]
      );
  }
}
