import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/helper/show_alert_dialog.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_elevated_button.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/widgets/short_h_bar.dart';
import 'package:flutter_starter/what_app/feature/auth/pages/image_picker_page.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_text_field.dart';
import 'package:flutter_starter/what_app/feature/auth/widgets/image_picker_icon.dart';
import 'package:image_picker/image_picker.dart';


class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;

  bool get imageNoExist {
    return imageCamera == null && imageGallery == null;
  }

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Profile photo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                CustomIconButton(onTap: () => Routes.pop(ctx), icon: Icons.close),
                const SizedBox(width: 20),
              ],
            ),
            Divider(color: ctx.theme.grayColor!.withOpacity(0.3)),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 20),
                ImagePickerIcon(
                  onTap: () => pickerImageByCamera(ImageSource.camera),
                  icon: Icons.camera_alt_outlined,
                  text: 'Camera',
                ),
                const SizedBox(width: 15),
                ImagePickerIcon(
                  onTap: () => pickerImageByCamera(ImageSource.gallery),
                  icon: Icons.photo_camera_back_rounded,
                  text: 'Gallery',
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  pickerImageByGallery() async {
    Routes.pop(context);
    final image = await Routes.pushBuilder<Uint8List>(context, const ImagePickerPage());
    if (image == null) return;
    setState(() {
      imageGallery = image;
      imageCamera = null;
    });
  }

  pickerImageByCamera(ImageSource source) async {
    Routes.pop(context);
    try {
      final image = await ImagePicker().pickImage(source: source);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch(e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile info',
          style: TextStyle(
            color: context.theme.authAppBarTextColor,
          ),
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Please provide your name and an optional profile photo',
              style: TextStyle(color: context.theme.grayColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: imagePickerTypeBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.photoIconBgColor,
                  border: Border.all(
                    color: imageNoExist ? Colors.transparent : context.theme.grayColor!.withOpacity(.4),
                  ),
                  image: (imageCamera != null || imageGallery != null)
                      ? DecorationImage(
                    fit: BoxFit.cover,
                    image: imageGallery != null
                        ? MemoryImage(imageGallery!) as ImageProvider
                        : FileImage(imageCamera!),
                  )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 48,
                    color: imageNoExist ? context.theme.photoIconColor : Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Expanded(
                    child: CustomTextField(
                      hintText: 'Type your name hear',
                      textAlign: TextAlign.left,
                      autoFocus: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: context.theme.photoIconColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: () {},
        text: 'NEXT',
        buttonWidth: 90,
      ),
    );
  }
}
