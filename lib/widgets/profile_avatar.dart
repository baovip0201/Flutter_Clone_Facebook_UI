import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_facbook/config/palette.dart';
import 'package:flutter/material.dart';

class ProflieAvatar extends StatelessWidget {
  const ProflieAvatar(
      {Key? key,
      required this.imgUrl,
      this.isActive = false,
      this.hasBorder = false})
      : super(key: key);
  final String imgUrl;
  final bool isActive;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Palette.facebookBlue,
        child: CircleAvatar(
          radius: hasBorder ? 17 : 20, 
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imgUrl),
        ),
      ),
      isActive
          ? Positioned(
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.white)),
              ),
              bottom: 0.0,
              right: 0.0,
            )
          : const SizedBox.shrink()
    ]);
  }
}
