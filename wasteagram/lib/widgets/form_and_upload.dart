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
          mainAxisAlignment: MainAxisAlignment.center,
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
                                      }
                                      return null;
                                    }
                                  ),
                          )
              ),
              FloatingActionButton(
          child: const Icon(Icons.cloud_upload),
          backgroundColor: Colors.blue,
          onPressed: () {
            if(formKey.currentState!.validate()){
              formKey.currentState?.save();
              date = DateFormat.yMMMMEEEEd().format(DateTime.now());
            }
            Posts newPost = Posts(date: date, 
                                  longitude: location!.longitude, 
                                  latitude: location!.latitude, 
                                  imageURL: widget.url,
                                  quantity: quantity);
            newPost.addPost();
            pushPostsListScreen(context);
          },
  
  )
          ]
      );
  }
}

Widget uploadButton(BuildContext context, formKey, String? date, Position? location, String? url, int quantity){
  return FloatingActionButton(
          child: const Icon(Icons.cloud_upload),
          backgroundColor: Colors.blue,
          onPressed: () {
            if(formKey.currentState!.validate()){
              formKey.currentState?.save();
              date = DateFormat.yMMMMEEEEd().format(DateTime.now());
            }
            Posts newPost = Posts(date: date, 
                                  longitude: location!.longitude, 
                                  latitude: location.latitude, 
                                  imageURL: url,
                                  quantity: quantity);
            newPost.addPost();
            pushPostsListScreen(context);
          },
  
  );
}

Widget quantityField(BuildContext context, int quantity){
  return Container(
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
                        }
                        return null;
                      }
    ),
  );
}