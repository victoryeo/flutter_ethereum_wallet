import 'page/create_wallet_page.dart';
import 'page/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    '/': (BuildContext context) {
      return IntroPage();
    },
    '/create': (BuildContext context) {
      return CreateWalletPage("Create wallet");
    },
  };
}