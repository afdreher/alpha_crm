import 'package:flutter/material.dart';

// NOTE: All of this is just mocked.  But, you can can change these values and
//       see the results reflected in the live version.
class UserModel extends ChangeNotifier {
  final String _name = "Jason";
  // HINT: Try something long, like Jacqueline to see the resize

  final int _totalEarnings = 6714;
  final int _servicesToSales = 32;
  final int _returns = 0;
  final int _averageSale = 219;
  final int _discounts = -147;


  String get name => _name;

  int get totalEarnings => _totalEarnings;
  int get servicesToSales => _servicesToSales;
  int get returns => _returns;
  int get averageSale => _averageSale;
  int get discounts => _discounts;
}