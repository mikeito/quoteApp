class Quote {
  final String quoteText;
  final String quoteAuthor;

  Quote({this.quoteText, this.quoteAuthor});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteText: json['quoteText'],
      quoteAuthor: json['quoteAuthor']
    );
  }

}