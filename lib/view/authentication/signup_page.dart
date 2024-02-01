import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/factory.dart';
import '../../helpers/spacer.dart';

class SignupScreen extends StatefulWidget {
  static const String route = "/signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(
          "Sign up",
          style: ProjectProperty.fontFactory.robotoStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCompulsoryHeading("Please fill all the mandatory details"),
                  vSpacing(30),
                  getCompulsoryHeading("User Name", size: 14),
                  vSpacing(15),
                  const CustomTextField(
                    hintText: "User Name",
                    iconWidgetUrl: "assets/images/user.svg",
                  ),
                  vSpacing(35),
                  getCompulsoryHeading("Email", size: 14),
                  vSpacing(15),
                  const CustomTextField(
                    hintText: "Enter Email ID",
                    iconWidgetUrl: "assets/images/mail.svg",
                  ),
                  vSpacing(35),
                  getCompulsoryHeading("Password", size: 14),
                  vSpacing(15),
                  const CustomTextField(
                    hintText: "Enter Password",
                    iconWidgetUrl: "assets/images/phone.svg",
                  ),
                  vSpacing(35),
                  vSpacing(40),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCompulsoryHeading(String text, {double size = 16}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: ProjectProperty.fontFactory.robotoStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: size,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "  *",
            style: ProjectProperty.fontFactory.robotoStyle.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 16,
              color: ProjectProperty.colorFactory.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? iconWidgetUrl;
  final String hintText;
  const CustomTextField({
    required this.hintText,
    this.iconWidgetUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (iconWidgetUrl != null)
          SizedBox(
            height: 16,
            width: 16,
            child: SvgPicture.asset(iconWidgetUrl!),
          ),
        hSpacing(10),
        Expanded(
          child: TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                  minHeight: 0, minWidth: 30, maxHeight: 5),
              isDense: true,
              alignLabelWithHint: true,
              hintText: hintText,
              labelStyle: ProjectProperty.fontFactory.robotoStyle,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
