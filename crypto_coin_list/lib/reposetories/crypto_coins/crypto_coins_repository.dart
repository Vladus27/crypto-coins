import 'package:crypto_coin_list/reposetories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await Dio().get( // create class instance and use get method for http request
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,WBT,NOT&tsyms=USD');//set api url
    final data = response.data as Map<String, dynamic>; //contains a Json-object that comes from the server
    final dataRaw = data['RAW'] as Map<String, dynamic>;
     // dataRaw.entries is a list of all currencies available in RAW
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData =
      //e.value contains data of the coin avaliable in USD
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE']; //select field price in USD
      final imageUrl = usdData['IMAGEURL']; //select field imageUrl in USD
    debugPrint(imageUrl.toString()); //loggin data
      return CryptoCoin(
        name: e.key, //name of the coin
        priceInUSD: price, 
        imageUrl: 'https://www.cryptocompare.com/$imageUrl', //set the site dommen with image url
      );
    }).toList();    //convert to list of our models
    return cryptoCoinList ;
  }
}
