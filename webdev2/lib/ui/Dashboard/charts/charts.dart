/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../test_data.dart';


class CategoryPieChart extends StatelessWidget {
   final List<charts.Series> seriesList;
  final bool animate;

  CategoryPieChart(this.seriesList, {this.animate});


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(

      seriesList,
      animate: animate,

      defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)]));
    
  }


}

class MonthlyBarChart extends StatelessWidget {
   final List<charts.Series> seriesList;
  final bool animate;

  MonthlyBarChart(this.seriesList, {this.animate});


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(

      seriesList,
      animate: animate,
    );
  }


}



class TopSuppliersTable extends StatelessWidget {
  const TopSuppliersTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text("Supplier")),
        DataColumn(label: Text("Spend"))
      ],
      rows: topSuppliers.map((supplier) => DataRow(
        cells: [
          DataCell (
            Text(supplier.supplier)
          ),
          DataCell (
            Text(supplier.sales.toString())
          )
        ]
      )
      ).toList());
  }
}

class TopLineItemsTable extends StatelessWidget {
  const TopLineItemsTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text("Description")),
        DataColumn(label: Text("Quantity")),
        DataColumn(label: Text("Average Rate")),
        DataColumn(label: Text("Total Spend"))
      ],
      rows: 
      topLineItems.map((item) => DataRow(
        cells: [
          DataCell (
            Text(item.description)
          ),
          DataCell (
            Text(item.quantity.toString())
          ),
            DataCell (
            Text(item.rate.toString())
          ),
            DataCell (
            Text(item.total.toString())
          )
        ]
      )
      ).toList());
  }
}