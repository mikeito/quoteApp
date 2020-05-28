import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/utils/util.dart';

class QuoteService {

  static Future<List<Quote>> readJson() async{
    try {
      final jsonString = await rootBundle.loadString('assets/quotes.json');
      List<Quote>  quoteList = parseQuotes(jsonString);
      Util.shuffle(quoteList);
      return quoteList;
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Quote> parseQuotes(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }

}