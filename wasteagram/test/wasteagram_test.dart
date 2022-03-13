import 'package:test/test.dart';
import 'package:wasteagram/models/post_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  test('Post created from constructor should carry appropriate values', (){
        String? date = DateTime.now().toString();
        String? imageURL = 'fake url';
        double? latitude = 1.3344;
        double? longitude = -4.333;
        int? quantity = 2;
        Timestamp? id = Timestamp.now();

        final Posts testPost = Posts(
          date: date,
          imageURL: imageURL,
          latitude: latitude,
          longitude: longitude,
          quantity: quantity,
          id: id
        );

        expect(testPost.date, date);
        expect(testPost.imageURL, imageURL);
        expect(testPost.latitude, latitude);
        expect(testPost.longitude, longitude);
        expect(testPost.quantity, quantity);
        expect(testPost.id, id);
  });

  test('Test to see that id field is passed the right type', (){
        String? date = DateTime.now().toString();
        String? imageURL = 'fake url';
        double? latitude = 1.3344;
        double? longitude = -4.333;
        int? quantity = 2;
        Timestamp? id = Timestamp.now();

        final Posts testPost = Posts(
          date: date,
          imageURL: imageURL,
          latitude: latitude,
          longitude: longitude,
          quantity: quantity,
          id: id
        );

        expect(testPost.id, id);
  });
}