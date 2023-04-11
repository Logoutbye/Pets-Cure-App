import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

class FullScreenProfilePicture extends StatefulWidget {
  String pictureSrc;
  var picturechanged;

  FullScreenProfilePicture(
      {required this.pictureSrc, required this.picturechanged, super.key});

  @override
  State<FullScreenProfilePicture> createState() =>
      _FullScreenProfilePictureState();
}

class _FullScreenProfilePictureState extends State<FullScreenProfilePicture> {
  var picturesrc;
  var picturechanged;
  @override
  void initState() {
    picturesrc = widget.pictureSrc;
    picturechanged = widget.picturechanged;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kSecondary,
      appBar: AppBar(
        title: Text("Profile Photo"),
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.kSecondary,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 8.0),
        //     child: Icon(Icons.delete),
        //   )
        // ],
      
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: widget.picturechanged
                  ? Image.file(
                      File(widget.pictureSrc).absolute,
                      fit: BoxFit.cover,
                    )
                  : Image.network(widget.pictureSrc)),
        ),
      ),
    );
  }
}
