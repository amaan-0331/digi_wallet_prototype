class StockItem {
  const StockItem({
    required this.symbol,
    required this.low,
    required this.high,
    required this.open,
    required this.date,
  });

  factory StockItem.fromJson(Map<String, dynamic> json) {
    return StockItem(
      symbol: json['symbol'] as String,
      low: json['low'] as double,
      high: json['high'] as double,
      open: json['open'] as double,
      date: DateTime.parse(json['date'] as String),
    );
  }

  final String symbol;
  final double low;
  final double high;
  final double open;
  final DateTime date;
}
