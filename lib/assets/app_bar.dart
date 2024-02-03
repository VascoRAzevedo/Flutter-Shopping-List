import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shadowColor: const Color.fromARGB(0, 255, 255, 255),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title:  const Center(
        child: Text(
            'ListMaker',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 37,
              fontWeight: FontWeight.w800,
              color: Colors.black54,
            ),
          ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
