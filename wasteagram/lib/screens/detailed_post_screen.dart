import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/loading_bar.dart';
import 'package:wasteagram/widgets/photo_container.dart';

class DetailedPost extends StatelessWidget {
  final int index;
  final String url;
  const DetailedPost({ Key? key, required this.index, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Wasteagram'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var post = snapshot.data?.docs[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(post!['date'].toString(), style: Theme.of(context).textTheme.headline5),
                photoBoxDetailScreen(context, url),
                Text('Items: ' + post['quantity'].toString(), style: Theme.of(context).textTheme.headline6),
                Text('Location: (' + post['longitude'].toString() + ', ' + post['latitude'].toString() + ')')
              ],
            );
          }
          return loadingBar(context);
        }
     )
   );
  }
}