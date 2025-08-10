import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemma/pigeon.g.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';
import 'package:wings_dating_app/src/ai_wingman/pages/ai_wingman_view.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/model_download_screen.dart';
import 'package:wings_dating_app/src/ai_wingman/services/model_download_service.dart';

class ModelSelectionScreen extends StatelessWidget {
  const ModelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final models = Model.values.where((model) {
      if (model.localModel) {
        return kIsWeb;
      }
      if (!kIsWeb) return true;
      return model.preferredBackend == PreferredBackend.gpu && !model.needsAuth;
    }).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF0b2351),
      appBar: AppBar(
        title: const Text('Select a Model'),
        backgroundColor: const Color(0xFF0b2351),
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(models[index].displayName),
            onTap: () async {
              // Web: go directly to chat (no local download flow)
              if (kIsWeb) {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => AIChatScreen(
                      model: models[index],
                    ),
                  ),
                );
                return;
              }

              // Mobile: if model exists locally, go to chat; otherwise, go to download screen
              final model = models[index];
              final downloader = ModelDownloadService(
                modelUrl: model.url,
                modelFilename: model.filename,
                licenseUrl: model.licenseUrl,
              );
              final exists = await downloader.existsLocally();

              if (context.mounted) {
                if (exists || model.localModel) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => AIChatScreen(
                        model: model,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => ModelDownloadScreen(
                        model: model,
                      ),
                    ),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
