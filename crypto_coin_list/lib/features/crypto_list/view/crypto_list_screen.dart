import 'package:flutter/material.dart';
import 'package:crypto_coin_list/features/crypto_list/widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    const String coinName = 'Bitcoin';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => CryptoCoinTile(coinName: coinName),
        separatorBuilder: (context, i) => Divider(),
        itemCount: 10,
      ),
    );
  }
}
