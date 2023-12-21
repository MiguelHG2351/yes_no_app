import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (!value.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please, send a message with some text'),
          ),
        );
        return;
        }

        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      controller: textController,
    );
  }
}
