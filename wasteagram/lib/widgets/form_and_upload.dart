import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/upload_button.dart';

class UploadAndForm extends StatefulWidget {
  final String? url;
  const UploadAndForm({ Key? key, required this.url}) : super(key: key);

  @override
  State<UploadAndForm> createState() => _UploadAndFormState();
}

class _UploadAndFormState extends State<UploadAndForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
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
          UploadButton(url: widget.url, formKey: _formKey)
        ]
      ),
    );
  }
}