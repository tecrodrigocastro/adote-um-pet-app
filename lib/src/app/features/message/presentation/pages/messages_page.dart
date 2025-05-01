import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';
import '../widgets/message_card.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: router.pop,
        ),
        centerTitle: false,
        backgroundColor: AppColors.secondaryColor,
        toolbarHeight: kToolbarHeight,
        title: Text(
          'Mensagens',
          style: theme.headlineMedium!.copyWith(
            fontSize: 33,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextInputGrayDs(
                  controller: textEditingController,
                  label: 'Pesquisar',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Conversas',
              style: theme.bodyLarge,
            ),
          ),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MessageCard(
                  onTap: () => context.push(AppRoutes.singleMessagePage),
                  message: 'aaaaaaaaaaaaaaaaa',
                  name: 'Logo ali',
                  image:
                      'https://content.imageresizer.com/images/memes/Blue-Smurf-cat-meme-7y117f.jpg',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
