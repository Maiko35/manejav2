class BriefingForecast {
  BriefingForecast({
    required this.tomorrowForecastUgx,
    required this.peakHour,
    required this.bestDay,
    required this.restockAlerts,
    required this.source,
  });

  final int tomorrowForecastUgx;
  final int peakHour;
  final String bestDay;
  final List<Map<String, dynamic>> restockAlerts;
  final String source;

  factory BriefingForecast.fromJson(Map<String, dynamic> json) {
    return BriefingForecast(
      tomorrowForecastUgx: (json['tomorrow_forecast_ugx'] as num?)?.toInt() ?? 0,
      peakHour: (json['peak_hour'] as num?)?.toInt() ?? 0,
      bestDay: (json['best_day'] ?? '').toString(),
      restockAlerts: (json['restock_alerts'] as List? ?? [])
          .whereType<Map>()
          .map((e) => e.cast<String, dynamic>())
          .toList(),
      source: (json['source'] ?? 'average').toString(),
    );
  }
}

class Briefing {
  Briefing({
    required this.shop,
    required this.date,
    required this.briefingText,
    required this.forecast,
    required this.lowStockCount,
  });

  final String shop;
  final String date;
  final String briefingText;
  final BriefingForecast forecast;
  final int lowStockCount;

  factory Briefing.fromJson(Map<String, dynamic> json) {
    return Briefing(
      shop: (json['shop'] ?? '').toString(),
      date: (json['date'] ?? '').toString(),
      briefingText: (json['briefing'] ?? '').toString(),
      forecast: BriefingForecast.fromJson(
        (json['forecast'] as Map<String, dynamic>?) ?? {},
      ),
      lowStockCount: (json['low_stock_count'] as num?)?.toInt() ?? 0,
    );
  }
}