// features/movie/presentation/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onProfileTap;
  final List<Widget>? actions;
  final bool showProfile;
  final Widget? leading;
  final bool showBackButton;
  final Color? backgroundColor;
  final double? elevation;
  final Color? titleColor;
  final double? titleFontSize;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onProfileTap,
    this.actions,
    this.showProfile = true,
    this.leading,
    this.showBackButton = false,
    this.backgroundColor,
    this.elevation,
    this.titleColor,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.white,
          fontSize: titleFontSize ?? 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                )
              : null),
      actions: [
        if (actions != null) ...actions!,
        if (showProfile)
          GestureDetector(
            onTap: onProfileTap ?? () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade800,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}