import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';

class ImagePickerIcon extends StatelessWidget {
  const ImagePickerIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          onTap: onTap,
          icon: icon,
          iconColor: Colours.greenDark,
          minWidth: 50,
          border: Border.all(color: context.theme.grayColor!.withOpacity(.2), width: 1),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: context.theme.grayColor),
        ),
      ],
    );
  }
}
