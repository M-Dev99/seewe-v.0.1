import 'package:flutter/material.dart';
import 'package:seewe/widget/camera_widget.dart';
import 'package:seewe/widget/gallery_widget.dart';

class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CameraWidget(),
          GalleryWidget(),
        ],
      ),
    );
  }
}
