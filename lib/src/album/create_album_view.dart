import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateAlbumView extends StatelessWidget {
  const CreateAlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Album')),
      body: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [Text("Album Name"), TextField()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
