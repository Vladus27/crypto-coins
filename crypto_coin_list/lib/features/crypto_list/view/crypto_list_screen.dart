import 'package:crypto_coin_list/reposetories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

import 'package:crypto_coin_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coin_list/reposetories/crypto_coins/crypto_coins_repository.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList; //list of model coins

  @override
  void initState() {
    _loadCryptoCoins(); //data initialization
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _cryptoCoinsList == null // when data
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
              separatorBuilder: (context, i) => Divider(),
              itemCount: _cryptoCoinsList!.length,
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinList(); //get values to the variable list
    setState(() {}); // update screen after initialization 
  }
}
