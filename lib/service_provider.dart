import './app_config.dart';
import 'provider/counter.dart';
import 'provider/walletd.dart';
import 'utils/configuration_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> createProviders(
    String params) async {
  final client = Web3Client(params, Client());
  final sharePrefs = await SharedPreferences.getInstance();
  final configurationService = ConfigurationService(sharePrefs);

  return
    [
      ChangeNotifierProvider.value(value: Counter()),
      ChangeNotifierProvider.value(value: Walletd()),
      Provider.value(value:configurationService),
    ];
}