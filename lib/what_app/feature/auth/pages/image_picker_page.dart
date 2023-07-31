import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;

  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) return;
    if (currentPage == lastPage) return;
    fetchAllImages();
  }

  fetchAllImages() async {
    lastPage = currentPage;
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return PhotoManager.openSetting();
    List<AssetPathEntity> album = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    List<AssetEntity> photos = await album[0].getAssetListPaged(
      page: currentPage,
      size: 24,
    );

    List<Widget> temp = [];
    for (var asset in photos) {
      temp.add(
        FutureBuilder(
          future: asset.thumbnailDataWithSize(
            const ThumbnailSize(200, 200),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () => Routes.pop(context, snapshot.data),
                  borderRadius: BorderRadius.circular(5),
                  splashFactory: NoSplash.splashFactory,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.grayColor!.withOpacity(.4),
                      ),
                      image: DecorationImage(
                        image: MemoryImage(snapshot.data as Uint8List),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox(width: 200, height: 200);
          },
        ),
      );
      setState(() {
        imageList = temp;
        currentPage++;
      });
    }
  }

  @override
  void initState() {
    fetchAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: CustomIconButton(
            onTap: () => Routes.pop(context),
            icon: Icons.arrow_back,
          ),
          title: Text(
            'WhatsApp',
            style: TextStyle(
              color: context.theme.authAppBarTextColor,
            ),
          ),
          centerTitle: true,
          actions: [
            CustomIconButton(
              onTap: () {},
              icon: Icons.more_vert,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scroll) {
              handleScrollEvent(scroll);
              return true;
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (_, index) {
                return imageList[index];
              },
              itemCount: imageList.length,
            ),
          ),
        )
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: CustomElevatedButton(
        //   onPressed: () => sendCodeToPhone(context),
        //   text: 'NEXT',
        //   buttonWidth: 90,
        // ),
        );
  }
}
