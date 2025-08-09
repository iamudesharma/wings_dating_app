import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ImagePreviewView extends StatelessWidget {
  const ImagePreviewView({super.key, @PathParam() required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: AutoLeadingButton()),
        body: Center(child: InteractiveViewer(child: Image.network(path))));
  }
}
