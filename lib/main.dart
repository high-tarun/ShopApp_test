import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project1/helpers/helper.dart';
import 'package:test_project1/routes.dart';
import 'package:test_project1/view/authentication/login_page.dart';

import 'bloc/home_screen_bloc.dart';
import 'helpers/factory.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeScreenBloc>(create: (context) => HomeScreenBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ProjectHelper.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:
            ProjectProperty.colorFactory.scaffoldBackgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 50)),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              ProjectProperty.colorFactory.primaryColor,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
                ProjectProperty.colorFactory.primaryColor),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ProjectProperty.colorFactory.primaryColor,
        ),
        primaryColor: ProjectProperty.colorFactory.primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: ProjectProperty.colorFactory.primaryColor),
          ),
        ),
        primarySwatch: Colors.blue,
        //  const MaterialColor(0xff164cff, {
        //   100: Color(0xff164cff),

        // }),
      ),
      initialRoute: LoginPage.route,
      themeMode: ThemeMode.light,
      onGenerateRoute: RoutesHandler.onGenerateRoute,
    );
  }
}
