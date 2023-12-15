import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
            print('Botón: $textValue');
            textController.clear();
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
        print('Submit value $value');
        textController.clear();
      },
      onChanged: (value) {
        print('Change value $value');
      },
      controller: textController,
    );
  }
}