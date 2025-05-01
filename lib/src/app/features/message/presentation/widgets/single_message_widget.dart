import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SingleMessageWidget extends StatelessWidget {
  final bool isSender;
  final String message;
  const SingleMessageWidget({
    super.key,
    required this.isSender,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: isSender
                  ? AppColors.primaryColor // Rosa para mensagens enviadas
                  : const Color(0xFFDADADA), // Cinza para mensagens recebidas
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomRight: isSender ? const Radius.circular(0) : null,
                bottomLeft: !isSender ? const Radius.circular(0) : null,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
