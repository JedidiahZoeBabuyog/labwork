import 'package:flutter/material.dart';
import 'package:monday_labwork/models/product.dart';
import 'package:realm/realm.dart';

class Products extends ChangeNotifier {
  final List<product> _prod = [product('123', 'Test Item', 25)];
  List<product> get items => _prod;
  late Realm realm;
  late RealmResults<product> _product;

  RealmResults<product> get products => _product;

  int get count {
    return _prod.length;
  }

  Products() {
    _initRealm();
    _loadItems();
  }

  void _initRealm() {
    var config = Configuration.local([product.schema], schemaVersion: 2);
    realm = Realm(config);
  }

  void _loadItems() {
    _product = realm.all<product>();
    notifyListeners();
  }

  void add(product p) {
    realm.write(() {
      realm.add(p);
    });
    notifyListeners();
  }

  void toggleFav(product p) {
    realm.write(() {
      p.isFav = !p.isFav;
    });
    notifyListeners();
  }
}

// class Product {
//   late String code;
//   late String name;
//   late double price;
//   bool isFav = false;

//   Product({
//     required this.code,
//     required this.name,
//     required this.price,
//   });
// }
