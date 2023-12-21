import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola bro!', fromWho: FromWho.me),
    Message(text: 'Qué onda! 😎', fromWho: FromWho.me),
    Message(text: 'Qué onda! 😎', fromWho: FromWho.hers),
    Message(text: 'Qué onda! 😎', fromWho: FromWho.me),
  ];

  Future<void> addMessage(String text) async {
    messageList.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
  }
}