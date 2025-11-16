import 'package:flutter/material.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_it/get_it.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart'
    show StreamAutocompleteOptions;
import 'package:wings_dating_app/src/ai_wingman/providers/gemma_provider.dart';

import 'package:substring_highlight/substring_highlight.dart'; // Assuming this is your SubstringHighlight widget
// import 'package:stream_autocomplete_options/stream_autocomplete_options.dart'; // Assuming this is your StreamAutocompleteOptions widget

class StreamGemmaAutocompleteOptions extends ConsumerStatefulWidget {
  const StreamGemmaAutocompleteOptions({
    super.key,
    required this.query,
    this.onOptionSelected,
  });

  final String query;
  final ValueSetter<String>? onOptionSelected;

  @override
  ConsumerState<StreamGemmaAutocompleteOptions> createState() =>
      _StreamGemmaAutocompleteOptionsState();
}

class _StreamGemmaAutocompleteOptionsState
    extends ConsumerState<StreamGemmaAutocompleteOptions> {
  List<String> _suggestions = [];
  Stream<dynamic>? _stream;

  @override
  void didUpdateWidget(covariant StreamGemmaAutocompleteOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query) {
      if (widget.query.isNotEmpty) {
        _fetchSuggestions(widget.query);
      } else {
        setState(() {
          _suggestions = [];
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // No local Gemma/model/chat initialization needed; use provider.
  }

  void _fetchSuggestions(String input) async {
    final chat = ref.read(gemmaProvider);
    final isModelInitialized =
        ref.read(gemmaProvider.notifier).isModelInitialized;

    if (!isModelInitialized || chat == null) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    setState(() {
      _suggestions = [''];
    });

    final String prompt = '''
Complete the following sentence naturally. Provide up to 3 short, distinct, and logical completions.
Each completion should start with the provided input.
Do not add any extra introductory text.
Format each suggestion on a new line, prefixed with a bullet point like "- ".

Input: "$input"
Completions:
''';

    try {
      await chat.addQuery(
        Message(
          text: prompt,
          isUser: true,
          type: MessageType.text,
        ),
      );

      _stream = chat.generateChatResponseAsync();
      final StringBuffer fullResponseBuffer = StringBuffer();
      await for (final token in _stream!) {
        if (token.runtimeType.toString() == 'TextResponse' &&
            token.token != null &&
            token.token.isNotEmpty) {
          fullResponseBuffer.write(token.token);
          setState(() {
            _suggestions[0] = input + fullResponseBuffer.toString().trim();
          });
        }
      }

      final String rawGemmaOutput = fullResponseBuffer.toString();
      debugPrint("Raw Gemma Output: $rawGemmaOutput");

      final List<String> parsedSuggestions = rawGemmaOutput
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.startsWith('- '))
          .map((line) => line.substring(2).trim())
          .where((suggestion) => suggestion.isNotEmpty)
          .toList();

      final filteredSuggestions = parsedSuggestions
          .where((s) => s.toLowerCase().startsWith(input.toLowerCase()))
          .toList();

      setState(() {
        if (filteredSuggestions.isNotEmpty) {
          _suggestions = filteredSuggestions.take(3).toList();
        } else {
          _suggestions =
              rawGemmaOutput.isNotEmpty ? [input + rawGemmaOutput.trim()] : [];
          if (_suggestions.isNotEmpty && _suggestions[0] == input) {
            _suggestions = [];
          }
        }
      });
    } catch (e) {
      debugPrint("Gemma error during suggestion fetch: $e");
      setState(() {
        _suggestions = [];
      });
    }
  }

  @override
  void dispose() {
    _stream?.listen(null).cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.query.isEmpty && _suggestions.isEmpty) {
      return const SizedBox.shrink();
    }
    if (widget.query.isNotEmpty && _suggestions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    return StreamAutocompleteOptions<String>(
      options: _suggestions,
      optionBuilder: (context, suggestion) {
        final theme = Theme.of(context);
        return ListTile(
          dense: true,
          title: SubstringHighlight(
            text: suggestion,
            term: widget.query,
            textStyleHighlight: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
            textStyle: theme.textTheme.bodyLarge!,
          ),
          onTap: widget.onOptionSelected == null
              ? null
              : () => widget.onOptionSelected!(suggestion),
        );
      },
    );
  }
}
