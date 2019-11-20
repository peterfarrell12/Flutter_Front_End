import 'package:flutter/material.dart';

class CompanyData {
  final String companyName;
  final dynamic companyPin;

  CompanyData(this.companyName, this.companyPin);

  CompanyData.fromData(Map<String, dynamic> data) :
  companyName = data['Company Name'],
  companyPin = data['Company Code'];

}
