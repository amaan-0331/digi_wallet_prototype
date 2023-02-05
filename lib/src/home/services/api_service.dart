import 'dart:convert';

import 'package:digi_wallet_prototype/src/home/models/stock_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StockApi {
  Future<List<StockItem>> fetchStocks() async {
    final apiKey = dotenv.env['marketstack_access_key'];

    final response = await http.get(
      Uri.parse(
        'http://api.marketstack.com/v1/eod?access_key=$apiKey&symbols=amzn,aapl,tsla&limit=3',
      ),
    );

    if (response.statusCode == 200) {
      final stockItems = <StockItem>[];
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final decodedBody = jsonDecode(response.body) as Map<String, dynamic>;

      final items = decodedBody['data'] as List;

      for (final item in items) {
        stockItems.add(StockItem.fromJson(item as Map<String, dynamic>));
      }

      return stockItems;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load stocks');
    }
  }
}
