import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/message_card.dart';
import '../widgets/profile_photo.dart';

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
        backgroundColor: AppColors.secondaryColor,
        toolbarHeight: kToolbarHeight + 30,
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
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextInputGrayDs(
                  controller: textEditingController,
                  label: 'Pesquisar',
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Usuários online',
                  style: theme.bodyLarge,
                ),
              ),
              const Gap(15),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: const EdgeInsets.only(left: 24),
                  itemBuilder: (_, index) {
                    return const Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                      ),
                      child: Column(
                        children: [
                          ProfilePhoto(
                            isOnline: true,
                            image:
                                'https://content.imageresizer.com/images/memes/Blue-Smurf-cat-meme-7y117f.jpg',
                          ),
                          Gap(10),
                          SizedBox(
                            width: 65,
                            child: Text(
                              'Logo ali',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(8),
            ],
          ),
          Container(
            height: 28,
            width: double.maxFinite,
            color: AppColors.beige,
          ),
          const Gap(30),
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
                return const MessageCard(
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
