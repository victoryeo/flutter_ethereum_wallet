import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'wallet_store.dart';

List<SingleChildWidget> createStore(
  String params) {
  final sharedPrefs =  SharedPreferences.getInstance();
  final walletStore = WalletStore();

  return [
    Provider.value(value: walletStore),
  ];
}