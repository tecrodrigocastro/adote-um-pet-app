import 'package:flutter/material.dart';

import 'profile_photo.dart';

class MessageCard extends StatelessWidget {
  //
  const MessageCard({
    super.key,
    required this.name,
    required this.message,
    required this.image,
  });

  final String name;
  final String message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 86,
        width: double.maxFinite,
        child: Row(
          spacing: 10,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 12),
              child: ProfilePhoto(
                isOnline: false,
                image:
                    'https://content.imageresizer.com/images/memes/Blue-Smurf-cat-meme-7y117f.jpg',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(name),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
