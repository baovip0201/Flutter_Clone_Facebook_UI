import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_facbook/config/palette.dart';
import 'package:clone_facbook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    post: post,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption!),
                  post.imageUrl != null
                      ? SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        )
                ]),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _PostState(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProflieAvatar(imgUrl: post.user!.imageUrl!),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user!.name!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print("Press"), icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;
  const _PostState({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${post.shares} Shares",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: "Like",
                onTap: () => print("Like")),
                _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: "Comment",
                onTap: () => print("Comment")),
                _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 25,
                ),
                label: "Share",
                onTap: () => print("Share"))
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  final Icon icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              icon,
              const SizedBox(width: 4,),
              Text(label)
            ]),
          ),
        ),
      ),
    );
  }
}
