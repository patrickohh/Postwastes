import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/widgets/loading_bar.dart';
import 'package:wasteagram/components/navigation.dart';
import 'package:wasteagram/widgets/choose_photo_button.dart';

class PostsList extends StatefulWidget {
  const PostsList({ Key? key }) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {

  int _selectedIndex = 0;

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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index){
                      var post = snapshot.data?.docs[index];
                      return ListTile(
                        title: Text(post!['date'].toString()),
                        trailing: Text(post['quantity'].toString()),
                        onTap: (){
                          setState(() {
                            _selectedIndex = index;
                          });
                          pushDetailedPostScreen(context, index, post['imageURL'].toString());
                        },
                      );
                    }
                  ),
                ),
                choosePhotoButton(context)
              ]           
            );
          }
          return loadingBar(context);
        }
      ),
    );
  }
}