import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override

  //call when context or other dependencies are changed
  void didChangeDependencies() {
    
    final args = ModalRoute.of(context) // get route from context
        ?.settings // contains info about the route (name/arguments)
        .arguments; //  data that was passed to this route.

    //for debuging, show info in red dead-screen for developers
    //if condition is true, the programm continues
    //if false -- show red dead screen with a message in the second parameter
    assert(args != null && args is String, 'you must provide args');

    // if(args == null){
    //   log('you must provide args');
    //   return;
    // }
    // if(args is! String){
    //   log('you must provide String args"');
    //   return;
    // }
    coinName = args
        as String; //use String cast because assert isn`t return any data to flutter

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
