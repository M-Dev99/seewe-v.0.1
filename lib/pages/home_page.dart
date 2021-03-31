import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seewe/enum/media_source.dart';
import 'package:seewe/pages/account_page.dart';
import 'package:seewe/pages/source_page.dart';
import 'package:seewe/widget/video_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File fileMedia;
  MediaSource source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: fileMedia == null
                    ? Icon(
                        Icons.photo,
                        size: 120,
                      )
                    : (source == MediaSource.image
                        ? Image.file(fileMedia)
                        : VideoWidget(fileMedia)),
              ),
              const SizedBox(
                height: 24,
              ),
              RaisedButton(
                onPressed: () => capture(MediaSource.image),
                color: Theme.of(context).primaryColor,
                child: Text("Capture Image"),
                shape: StadiumBorder(),
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () => capture(MediaSource.video),
                child: Text('Capture Video'),
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  ),
                ),
                child: Text('Account Page'),
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );
    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}
