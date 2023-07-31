import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/helper/show_alert_dialog.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_elevated_button.dart';
import 'package:flutter_starter/what_app/feature/auth/controller/auth_controller.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'China');
    countryCodeController = TextEditingController(text: '86');
    phoneNumberController = TextEditingController(text: '18906057366');
    super.initState();
  }

  showCountryCodePicker(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['CN'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.grayColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.grayColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Colours.greenDark,
          ),
          hintText: 'Search country code or name',
          alignLabelWithHint: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.grayColor!.withOpacity(0.2)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colours.greenDark),
          ),
        ),
      ),
      onSelect: (Country value) {
        countryNameController.text = value.name;
        countryCodeController.text = value.phoneCode;
      },
    );
  }

  sendCodeToPhone(BuildContext context) {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;
    if (phoneNumber.isEmpty) {
      return showAlertDialog(context: context, message: 'Please enter your phone number');
    }
    if (phoneNumber.length < 9) {
      return showAlertDialog(
          context: context,
          message:
              "The phone number your entered is too short for the country: $countryName.\n\nInclude your area code if yoe haven't");
    }

    ref.read(authControllerProvider).sendSmsCode(
          context: context,
          phoneNumber: '+$countryCode$phoneNumber',
        );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Enter your phone number',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'WhatsApp will need to verify your phone number. ',
                style: TextStyle(
                  color: context.theme.grayColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(color: context.theme.blueColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              controller: countryNameController,
              onTap: () => showCountryCodePicker(context),
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colours.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    controller: countryCodeController,
                    onTap: () => showCountryCodePicker(context),
                    readOnly: true,
                    prefixText: '+',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    hintText: 'phone number',
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Carrier charges may apply',
            style: TextStyle(
              color: context.theme.grayColor,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: () => sendCodeToPhone(context),
        text: 'NEXT',
        buttonWidth: 90,
      ),
    );
  }
}
