import 'package:provider/single_child_widget.dart';

import 'router.dart';
import 'app_config.dart';
import 'service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final stores = await createProviders(AppConfig().params["dev"]);
  runApp(EthApp(stores));
}

class EthApp extends StatelessWidget {
  EthApp(this.stores);
  final List<SingleChildWidget> stores;

  @override
  Widget build(BuildContext context) {
    print("stores: $stores");
    return MultiProvider(
      providers:
        //[ChangeNotifierProvider.value(value: Counter()),],
        stores,
      child: new MaterialApp(
        title: 'Wallet App',
        initialRoute: '/',
        routes: getRoutes(context),
        theme: ThemeData(
          primaryColor: Colors.green,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
          )
        )
      )
    );
  }
}
