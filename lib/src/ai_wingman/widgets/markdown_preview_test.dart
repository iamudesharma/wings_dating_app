// This file is used to analyze and test the gpt_markdown package for rendering markdown in chat messages.
// It will be used to replace flutter_markdown in ModernChatMessage.

import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class MarkdownPreviewTest extends StatelessWidget {
  final String markdownText;
  const MarkdownPreviewTest({super.key, required this.markdownText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPT Markdown Preview')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GptMarkdown(
           markdownText,
        ),
      ),
    );
  }
}
