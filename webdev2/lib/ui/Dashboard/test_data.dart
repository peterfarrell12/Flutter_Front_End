
class SalesPerMonth {
  final String month;
  final int sales;

  SalesPerMonth(this.month, this.sales);
}

    List<SalesPerMonth> monthlyData = [
        SalesPerMonth("Jan", 100),
  SalesPerMonth("Feb", 200),
  SalesPerMonth("Mar", 300),
  SalesPerMonth("Apr", 400),
  SalesPerMonth("May", 300),
  SalesPerMonth("Jun", 700),
  SalesPerMonth("Jul", 800),
  SalesPerMonth("Aug", 300),
  SalesPerMonth("Sep", 300),
  SalesPerMonth("Oct", 200),
  SalesPerMonth("Nov", 100),
  SalesPerMonth("Dec", 700),
    ];

  
class SalesPerCategory {
    final String category;
  final int sales;

  SalesPerCategory(this.category, this.sales);
}

List<SalesPerCategory> categoryData = [
  SalesPerCategory("Packaging", 10),
  SalesPerCategory("Chemicals", 15),
  SalesPerCategory("IT & Telecoms", 19),

];


class TopSuppliers {
  final String supplier;
  final int sales;

  TopSuppliers(this.supplier, this.sales);


}

  List<TopSuppliers> topSuppliers = [
    TopSuppliers("Connacht Gold", 2000),
    TopSuppliers("NCT Centre Ireland", 10000),
    TopSuppliers("My Company Computor Sales", 4000),
    TopSuppliers("Pennys", 1500),
    TopSuppliers("Lifestyle Sports", 16000),
    TopSuppliers("BCS Crane Hire", 8000),
    TopSuppliers("Mama's & Papa's", 12000),
    TopSuppliers("Dunnes Stores", 800),
    TopSuppliers("SuperValu", 2800),
    TopSuppliers("Lidl", 3500),

  ];


class TopLineItems {
  final String description;
  final int quantity;
  final int rate;
  final int total;

  TopLineItems(this.description,this.quantity,this.rate,this.total);

}

List<TopLineItems> topLineItems = [

  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
  TopLineItems("My Toy 1", 6, 10, 60),
TopLineItems("My Toy 1", 6, 10, 60),

];