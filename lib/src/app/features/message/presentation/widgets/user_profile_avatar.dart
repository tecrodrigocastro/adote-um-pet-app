import 'package:flutter/material.dart';

import 'profile_photo.dart';

class UserProfileAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;
  const UserProfileAvatar({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
      ),
      child: Column(
        spacing: 10,
        children: [
          ProfilePhoto(
            image: imageUrl,
          ),
          SizedBox(
            width: 65,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
