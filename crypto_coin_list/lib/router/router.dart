//import '../features/crypto_list/crypto_list.dart';
import 'package:crypto_coin_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coin_list/features/crypto_coin/view/view.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => const CryptoListScreen(title: 'Crypto Currencies List'), //main page by default
  '/coin': (ctx) => const CryptoCoinScreen() //route for another screen
};
