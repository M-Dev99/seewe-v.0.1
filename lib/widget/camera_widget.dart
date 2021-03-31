import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seewe/enum/media_source.dart';
import 'package:seewe/widget/list_tile_widget.dart';

class CameraWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
        text: 'From Camera',
        icon: Icons.camera_alt,
        onClicked: () => pickCameraMedia(context));
  }

  Future pickCameraMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;
    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;
    final media = await getMedia(source : ImageSource.camera);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
