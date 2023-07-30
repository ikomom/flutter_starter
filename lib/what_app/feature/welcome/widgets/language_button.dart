import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  showBottomSheet(ctx) {
    return showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                    color: context.theme.grayColor!.withOpacity(0.4), borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  CustomIconButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.close_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'App Language',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: context.theme.grayColor!.withOpacity(0.3), thickness: 0.5),
              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                title: const Text('English'),
                subtitle: Text(
                  "(phone's language)",
                  style: TextStyle(color: context.theme.grayColor),
                ),
              ),
              RadioListTile(
                value: true,
                groupValue: false,
                onChanged: (value) {},
                title: const Text('中文'),
                subtitle: Text(
                  "(chinese simple)",
                  style: TextStyle(color: context.theme.grayColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        highlightColor: context.theme.langBtnHighlightColor,
        splashFactory: NoSplash.splashFactory,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: OverflowBar(
            spacing: 5,
            children: [
              Icon(
                Icons.language,
                color: Colours.greenDark,
              ),
              Text(
                'English',
                style: TextStyle(
                  color: Colours.greenDark,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colours.greenDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
