import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/factory.dart';
import '../../helpers/spacer.dart';
import '../authentication/signup_page.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffa0a0a0).withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/user.svg",
                    height: 55,
                    width: 55,
                    color: Colors.black,
                  ),
                  hSpacing(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tarun Gupta",
                        style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      vSpacing(5),
                      Text(
                        " xyz@gmail.com",
                        style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            vSpacing(20),
            Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffa0a0a0).withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
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
                      "Update Profile",
                      style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
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
