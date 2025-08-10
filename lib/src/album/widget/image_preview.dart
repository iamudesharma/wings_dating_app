import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ImagePreviewView extends StatelessWidget {
  const ImagePreviewView({super.key, @PathParam() required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(leading: const AutoLeadingButton(), backgroundColor: Colors.black, elevation: 0),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 5,
          child: Hero(
            tag: path,
            child: Image.network(path, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
