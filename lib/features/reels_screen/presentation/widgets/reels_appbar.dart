import 'package:flutter/material.dart';

class ReelsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReelsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        "Reels",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
