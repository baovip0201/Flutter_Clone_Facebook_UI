import 'package:clone_facbook/config/palette.dart';
import 'package:clone_facbook/data/data.dart';
import 'package:clone_facbook/models/models.dart';
import 'package:clone_facbook/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                onPressed: () => print("Search"),
                icon: Icons.search,
                iconSize: 30,
              ),
              CircleButton(
                onPressed: () => print("Messenger"),
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
              )
            ],
          ),
          SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)),
          SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers),
              )),
          SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              )),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length))
        ],
      ),
    );
  }
}
