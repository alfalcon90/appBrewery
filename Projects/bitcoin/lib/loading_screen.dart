import 'package:flutter/material.dart';
import './coin_data.dart';
import './price_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  CoinData coin = CoinData();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Map<String, int> coins = await coin.getAllCoins('USD');

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PriceScreen(
                  coins: coins,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
