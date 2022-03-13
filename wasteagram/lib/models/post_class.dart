import 'package:cloud_firestore/cloud_firestore.dart';

class Posts{
  String? date;
  String? imageURL;
  double? latitude;
  double? longitude;
  int? quantity;
  Timestamp? id;

  Posts({this.date, this.imageURL, this.latitude, this.longitude, this.quantity, this.id});

  void addPost(){
    FirebaseFirestore.instance.collection('posts').add({
      'latitude': latitude,
      'longitude': longitude,
      'imageURL': imageURL,
      'date': date,
      'quantity': quantity,
      'id': id
    });
  }
}