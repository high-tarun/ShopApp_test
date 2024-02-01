import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/factory.dart';
import '../../helpers/spacer.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SearchBar(),
          vSpacing(20),
          Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.2,
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
            child: Center(
              child: Text(
                "Get List of Products",
                style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: const Color(0xff5F5F5F),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffEBEBED),
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                "assets/images/Search.svg",
                height: 20,
                width: 20,
              ),
            ),
            Text(
              "Search by product",
              style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                color: Colors.grey.shade400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
