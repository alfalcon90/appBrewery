import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> coinList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<int> getCoinData(String base, String quote) async {
    Uri url = Uri.https(
        'rest.coinapi.io', '/v1/exchangerate/$base/$quote', {'apikey': 'key'});

    http.Response res = await http.get(url);
    dynamic data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      double rate = data['rate'];
      return rate.toInt();
    } else {
      print(res);
      return null;
    }
  }

  Future<Map<String, int>> getAllCoins(String quote) async {
    var cryptoData = Map<String, int>();

    await Future.forEach(coinList, (coin) async {
      int rate = await getCoinData(coin, quote);
      if (rate != null) {
        cryptoData[coin] = rate;
      }
    });

    return cryptoData;
  }
}
