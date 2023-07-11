import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/resources/values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.backgroundColor,
  });

  final String title;
  final double height;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title),
      leading: context.canPop()
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppSize.s20,
              ),
            )
          : null,
    );
  }
}
