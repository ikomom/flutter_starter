import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';
import 'package:flutter_starter/what_app/feature/home/call_home_page.dart';
import 'package:flutter_starter/what_app/feature/home/chat_home_page.dart';
import 'package:flutter_starter/what_app/feature/home/status_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: [
            CustomIconButton(onTap: () {}, icon: Icons.search),
            CustomIconButton(onTap: () {}, icon: Icons.more_vert),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            splashFactory: NoSplash.splashFactory,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: [
            ChatHomePage(),
            StatusHomePage(),
            CallHomePage(),
          ],
        ),
      ),
    );
  }
}
