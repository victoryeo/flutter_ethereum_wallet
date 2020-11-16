import '../components/display_mnemonic.dart';
import '../components/confirm_mnemonic.dart';
import '../provider/counter.dart';
import '../provider/walletd.dart';
import '../utils/configuration_service.dart';
import '../stores/wallet_store.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class CreateWalletPage extends HookWidget {
  CreateWalletPage(this.title);
  final String title;
  //WalletCreateSteps step = WalletCreateSteps.display;

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }
  void _setStep(BuildContext context, WalletCreateSteps step) {
    Provider.of<Walletd>(context, listen: false).setStep(step);
  }

  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    var step = Provider.of<Walletd>(context).getStep;
    print("step: $step");
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body:
        step == WalletCreateSteps.display
            ? DisplayMnemonic(
              mnemonic: bip39.generateMnemonic(),
              onNext: () async {
                _setStep(context, WalletCreateSteps.confirm);
                _incrementCounter(context);
              }
            )
            : ConfirmMnemonic(
              mnemonic: "test",
              onConfirm: (confirmedText) async {
                Navigator.of(context).popAndPushNamed("/");
                _setStep(context, WalletCreateSteps.display);
              },
              onGenerateNew: () async {
                bip39.generateMnemonic();
                _setStep(context, WalletCreateSteps.display);
              },
              errors: [],
            ),
    );
  }
}