import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otp_generator/app_bloc.dart';
import 'package:otp_generator/base/navigation_utils.dart';
import 'package:otp_generator/res/R.dart';
import 'package:otp_generator/ui/authenticator/authenticator_page.dart';
import 'package:otp_generator/ui/tx_widgets/tx_qr_scanner.dart';

import 'base/bloc_state.dart';
import 'generated/l10n.dart';

class OtpGeneratorApp extends StatefulWidget {
  const OtpGeneratorApp({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> appGlobalKey = GlobalKey<NavigatorState>();

  @override
  State<StatefulWidget> createState() => _OtpGeneratorState();
}

class _OtpGeneratorState
    extends StateWithBloC<OtpGeneratorApp, OtpGeneratorBloC> {
  @override
  Widget buildWidget(BuildContext context) {
    return MaterialApp(
      navigatorKey: OtpGeneratorApp.appGlobalKey,
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationUtils.homeRoute,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      title: "OTPGenerator",
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: R.color.whiteColor),
            titleTextStyle: TextStyle(color: R.color.whiteColor),
            backgroundColor: R.color.primaryColor,
          ),
          brightness: Brightness.light,
          primaryColor: R.color.primaryColor,
          textSelectionTheme: TextSelectionThemeData(cursorColor: R.color.primaryColor)),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: (RouteSettings settings) {
        if(settings.name == NavigationUtils.homeRoute) {
          return MaterialPageRoute(
              settings: const RouteSettings(name: NavigationUtils.homeRoute),
              builder: (_) => const AuthenticatorPage());
        } else if (settings.name == NavigationUtils.scanRoute) {
          return MaterialPageRoute(
              settings: const RouteSettings(name: NavigationUtils.scanRoute),
              builder: (_) => QRScanner());
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
