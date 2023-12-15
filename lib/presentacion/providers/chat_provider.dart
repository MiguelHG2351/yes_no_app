import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola bro!', fromWho: FromWho.me),
    Message(text: 'Qué onda! 😎', fromWho: FromWho.me),
  ];

  Future<void> addMessage(String text) async {
    // this.message.add(message);
    // notifyListeners();
  }
}