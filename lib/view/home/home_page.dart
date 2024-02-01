import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project1/view/authentication/login_page.dart';
import 'package:test_project1/view/home/favourites_tab.dart';
import 'package:test_project1/view/home/product_tab.dart';
import 'package:test_project1/view/home/profile_tab.dart';

import '../../bloc/home_screen_bloc.dart';
import '../../helpers/factory.dart';
import '../../helpers/spacer.dart';
import 'home_tab.dart';

class HomePageScreen extends StatefulWidget {
  static const String route = '/home-page-screen';
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageTab _currentTab = HomePageTab.home;
  late final HomeScreenBloc _homeScreenBloc;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    _homeScreenBloc.bottomNavState.listen((value) {
      if (mounted) {
        setState(() {
          _currentTab = value;
        });
      }
    });
  }

  Widget get _getCurrentScreen {
    switch (_currentTab) {
      case HomePageTab.home:
        return const HomeTabScreen();
      case HomePageTab.product:
        return const ProductTabScreen();
      case HomePageTab.favourites:
        return const FavouriteTabScreen();
      case HomePageTab.profile:
        return const ProfileTabScreen();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ProjectProperty.colorFactory.scaffoldBackgroundColor,
      bottomNavigationBar: const BottomNavBar(),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 81),
        child: HomePageAppbar(
          scaffoldKey: scaffoldKey,
          appTitle: _currentTab == HomePageTab.home
              ? "HOME PAGE"
              : _currentTab == HomePageTab.product
                  ? "PRODUCT LIST"
                  : _currentTab == HomePageTab.favourites
                      ? "FAVOURITES"
                      : "PROFILE",
        ),
      ),
      drawer: const ProjectDrawer(),
      body: SafeArea(
        child: _getCurrentScreen,
      ),
    );
  }
}

class ProjectDrawer extends StatefulWidget {
  const ProjectDrawer({Key? key}) : super(key: key);

  @override
  State<ProjectDrawer> createState() => _ProjectDrawerState();
}

class _ProjectDrawerState extends State<ProjectDrawer> {
  List<DrawerItems> get items => [
        DrawerItems(
          onTap: (context) {},
          title: "Profile",
          iconURL: "add_retailer.svg",
        ),
        DrawerItems(
          onTap: (context) {},
          title: "Products",
          iconURL: "catalog_menu.png",
        ),
        DrawerItems(
          onTap: (context) {
            // Navigator.of(context).pop();
            // BlocProvider.of<HomeScreenBloc>(context)
            //     .bottomNavState
            //     .add(HomePageTab.reports);
          },
          title: "Favourites",
          iconURL: "general_reports.png",
        ),
        DrawerItems(
          onTap: (context) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
            // Navigator.of(context).pop();
            // BlocProvider.of<HomeScreenBloc>(context)
            //     .bottomNavState
            //     .add(HomePageTab.reports);
          },
          title: "Logout",
          iconURL: "save_menu.svg",
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ProjectProperty.colorFactory.drawerColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60),
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  vSpacing(15),
                  Divider(
                    height: 1,
                    color: Colors.white.withOpacity(0.27),
                    endIndent: 80,
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    items[index].onTap(context);
                  },
                  leading: items[index].iconURL.endsWith(".png")
                      ? Image.asset("assets/images/${items[index].iconURL}")
                      : SvgPicture.asset(
                          "assets/images/${items[index].iconURL}"),
                  title: Text(
                    items[index].title,
                    style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                );
              },
              itemCount: items.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return vSpacing(0);
              },
            ),
            Divider(
              height: 1,
              color: Colors.white.withOpacity(0.27),
              endIndent: 80,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late HomeScreenBloc _homeScreenBloc;
  HomePageTab _currentTab = HomePageTab.home;

  @override
  void initState() {
    super.initState();
    _homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    _currentTab = _homeScreenBloc.bottomNavState.value;
    _homeScreenBloc.bottomNavState.listen((value) {
      if (mounted) {
        setState(() {
          _currentTab = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 40,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavButton(
                    onTap: () {
                      _homeScreenBloc.bottomNavState.add(HomePageTab.home);
                    },
                    iconURL: "home",
                    currentValue: _currentTab,
                    tabValue: HomePageTab.home,
                  ),
                  BottomNavButton(
                    onTap: () {
                      _homeScreenBloc.bottomNavState.add(HomePageTab.product);
                    },
                    iconURL: "product",
                    currentValue: _currentTab,
                    tabValue: HomePageTab.product,
                  ),
                  BottomNavButton(
                    onTap: () {
                      _homeScreenBloc.bottomNavState
                          .add(HomePageTab.favourites);
                    },
                    iconURL: "reports",
                    currentValue: _currentTab,
                    tabValue: HomePageTab.favourites,
                  ),
                  BottomNavButton(
                    onTap: () {
                      _homeScreenBloc.bottomNavState.add(HomePageTab.profile);
                    },
                    iconURL: "user",
                    currentValue: _currentTab,
                    tabValue: HomePageTab.profile,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItems {
  final Function(BuildContext context) onTap;
  final String title;
  final String iconURL;

  DrawerItems({
    required this.onTap,
    required this.title,
    required this.iconURL,
  });
}

class BottomNavButton extends StatelessWidget {
  final String iconURL;
  final VoidCallback onTap;
  final HomePageTab currentValue;
  final HomePageTab tabValue;
  const BottomNavButton({
    required this.onTap,
    required this.iconURL,
    required this.currentValue,
    required this.tabValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          "assets/images/$iconURL.svg",
          height: 25,
          width: 25,
          color: currentValue == tabValue
              ? ProjectProperty.colorFactory.primaryColor
              : Colors.black,
        ),
      ),
    );
  }
}

class HomePageAppbar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String appTitle;

  const HomePageAppbar(
      {Key? key, required this.scaffoldKey, required this.appTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset("assets/images/menu.svg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.38),
            child: Text(
              appTitle,
              style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 18,
                height: 21 / 18,
              ),
            ),
          ),
          // const Spacer(
          //   flex: 3,
          // ),
          // Spacer(flex: 5),
        ],
      ),
    );
  }
}
