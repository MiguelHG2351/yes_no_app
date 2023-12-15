import 'package:flutter/material.dart';
import 'package:yes_no_app/presentacion/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentacion/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentacion/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juan'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/90.jpg'),
          ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const MyMessageBubble()
                    : const HerMessageBubble();
              },
            )),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
