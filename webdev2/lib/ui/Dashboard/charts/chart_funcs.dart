import '../test_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

List<charts.Series<SalesPerCategory, String>> createCategoryData(List<SalesPerCategory> data) {
  return [
    new charts.Series<SalesPerCategory, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (SalesPerCategory sales, _) => sales.category,
      measureFn: (SalesPerCategory sales, _) => sales.sales,
      data: data,
    )
  ];
}

List<charts.Series<SalesPerMonth, String>> createMonthlyData(List<SalesPerMonth> data) {
  return [
    new charts.Series<SalesPerMonth, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (SalesPerMonth sales, _) => sales.month,
      measureFn: (SalesPerMonth sales, _) => sales.sales,
      data: data,
    )
  ];
}

