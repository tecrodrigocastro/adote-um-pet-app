import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/single_message_widget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
        backgroundColor: AppColors.secondaryColor,
        toolbarHeight: kToolbarHeight,
        title: const Text(
          'Mensagens',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SingleMessageWidget(
              isSender: false,
              message: 'Oi, tudo bem?',
            ),
            SingleMessageWidget(
              isSender: false,
              message: 'Oi, tudo bem?',
            ),
            SingleMessageWidget(
              isSender: false,
              message:
                  "Que ótimo Mariana! Espero que vocês sejam muito felizes juntos",
            ),
            SingleMessageWidget(
              isSender: true,
              message:
                  "Que ótimo Mariana! Espero que vocês sejam muito felizes juntos",
            ),
            SingleMessageWidget(
              message:
                  "Que ótimo Mariana! Espero que vocês sejam muito felizes juntos",
              isSender: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEAEAEA),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            spacing: 10,
            children: [
              TextInputDs(
                label: 'Digite sua mensagem',
              ),
              InkWell(
                child: Icon(
                  Icons.send,
                  size: 35,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
