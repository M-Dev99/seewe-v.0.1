import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seewe/enum/media_source.dart';
import 'package:seewe/widget/list_tile_widget.dart';

class GalleryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
      text: 'From Gallery',
      icon: Icons.photo,
      onClicked: () => pickGalleryMedia(context),
    );
  }

  Future pickGalleryMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;
    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;
    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media.path);
    Navigator.of(context).pop(file);
  }
}
