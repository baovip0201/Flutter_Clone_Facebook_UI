import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_facbook/data/data.dart';
import 'package:clone_facbook/models/models.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, this.currentUser}) : super(key: key);
  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              backgroundImage:
                  CachedNetworkImageProvider(currentUser!.imageUrl),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind ?'),
              ),
            )
          ],
        ),
        Divider(
          height: 15,
          thickness: 0.5,
        ),
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton.icon(
                onPressed: () => print("Live"),
                icon: Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                label: Text("Live")
              ), 
              VerticalDivider(width: 8.0,),
              FlatButton.icon(
                onPressed: () => print("Live"),
                icon: Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                label: Text("Live")
              ), 
              VerticalDivider(width: 8.0,),
              FlatButton.icon(
                onPressed: () => print("Live"),
                icon: Icon(
                  Icons.video_call,
                  color: Colors.purpleAccent,
                ),
                label: Text("Live")
              ), 
            ],
          ),
        )
      ]),
    );
  }
}
