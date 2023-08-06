import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/helper/feature_watch.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';
import 'package:flutter_starter/what_app/feature/contact/controllers/contacts_controller.dart';
import 'package:flutter_starter/what_app/feature/contact/widget/contact_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/widgets/custom_icon_button.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  shareSmsLink(phoneNumber) async {
    Uri sms = Uri.parse(
      "sms:$phoneNumber?body=Let's chat on WhatsApp! it's a fast, simple, and secure app we can call each other for free. Get it at https://whatsapp.com/dl/",
    );
    if (await launchUrl(sms)) {
    } else {}
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select contact',
            ),
            const SizedBox(height: 3),
            ref.watch(contactControllerProvider).when(data: (allContacts) {
              return Text(
                '${allContacts[0].length} contact${allContacts[0].length == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 12),
              );
            }, error: (e, t) {
              return const SizedBox();
            }, loading: () {
              return const Text(
                'counting',
                style: TextStyle(fontSize: 12),
              );
            })
          ],
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.search,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: featureWatch(
        context: context,
        ref: ref,
        provider: contactControllerProvider,
        data: (allContacts) {
          var [firebaseContacts, phoneContacts] = allContacts;
          // if (phoneContacts.isEmpty) {
          //   return const Center(
          //     child: Text('contact is empty'),
          //   );
          // }
          return ListView.builder(
            itemCount: phoneContacts.length + firebaseContacts.length,
            itemBuilder: (context, index) {
              return index < firebaseContacts.length
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              myListTile(
                                leading: Icons.group,
                                text: 'New group',
                              ),
                              myListTile(
                                leading: Icons.contacts,
                                text: 'New contact',
                                trailing: Icons.qr_code,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Contacts on WhatsApp',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: context.theme.grayColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ContactCard(
                            contactSource: firebaseContacts[index],
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.chat,
                                arguments: firebaseContacts[index],
                              );
                            })
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == allContacts[0].length)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Text(
                              'Invite to WhatsApp',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: context.theme.grayColor,
                              ),
                            ),
                          ),
                        ContactCard(
                          contactSource: phoneContacts[index - firebaseContacts.length],
                          onTap: () => shareSmsLink(phoneContacts[index - firebaseContacts.length].phoneNumber),
                        )
                      ],
                    );
            },
          );
        },
      ),
    );
  }

  ListTile myListTile({
    required IconData leading,
    required String text,
    IconData? trailing,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colours.greenDark,
        child: Icon(
          leading,
          color: Colors.white,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        trailing,
        color: Colours.grayDark,
      ),
    );
  }
}
