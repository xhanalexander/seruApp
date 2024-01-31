import 'dart:io';

import 'package:flutter/material.dart';

class FullPicture extends StatelessWidget {
  final String image;

  const FullPicture({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        child: Center(
          child: Hero(
            tag: image,
            child: Image.file(
              File(image),
              fit: BoxFit.cover,
            )
          ),
        ),
      ),
    );
  }
}