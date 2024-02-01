import 'package:flutter/material.dart';
import 'package:test_project1/view/authentication/login_page.dart';
import 'package:test_project1/view/authentication/signup_page.dart';
import 'package:test_project1/view/home/home_page.dart';

class RoutesHandler {
  static Route onGenerateRoute(RouteSettings settings) {
    late Widget widget;
    String? screenName = settings.name;
    var args = settings.arguments;
    switch (screenName) {
      case LoginPage.route:
        widget = const LoginPage();
        break;
      case SignupScreen.route:
        widget = const SignupScreen();
        break;
      case HomePageScreen.route:
        widget = const HomePageScreen();
        break;
      // case BookingPage.route:
      //   widget = BookingPage(
      //     qrCode: (args is String) ? args : "",
      //     products: (args is List<Products>) ? args : null,
      //   );
      //   break;
      // case DetailedCartPage.route:
      //   widget = DetailedCartPage(args: args as DetailedCartPageArgs);
      //   break;
      // case SignaturePage.route:
      //   widget = const SignaturePage();
      //   break;
      // case BookingSummaryPage.route:
      //   widget = BookingSummaryPage(
      //     pageIndex: (args is int) ? args : 0,
      //   );
      //   break;
      // case AfterConfirmationPage.route:
      //   widget = AfterConfirmationPage();
      //   break;
      // case MultiScanPage.route:
      //   widget = const MultiScanPage();
      //   break;
      // case DetailedReportPage.route:
      //   widget = DetailedReportPage(args: args as DetailedReportPageArgs);
      //   break;
      // case LooksPage.routeName:
      //   widget = const LooksPage();
      //   break;
      // case DetailedSizeReportPage.route:
      //   widget =
      //       DetailedSizeReportPage(args: args as DetailedSizeReportPageArgs);
      //   break;
      // case OtherReports.route:
      //   widget = OtherReports();
      //   break;
      default:
        widget = const Scaffold();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
