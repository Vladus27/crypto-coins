import 'package:flutter/material.dart';

import 'package:crypto_coin_list/router/router.dart';
import 'package:crypto_coin_list/theme/theme.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies List',
      theme: theme,
      routes: router,

      // home: const CryptoListScreen(title: 'Crypto Currencies List'),
      //
    );
  }
}
