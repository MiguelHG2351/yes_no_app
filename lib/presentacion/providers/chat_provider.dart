import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helper/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    
  ];

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> addMessage(String text) async {
    if (text.isEmpty) return;

    if (text.endsWith('?')) {
      herReply();
    }

    messageList.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut);
  }
}
