import 'package:realm/realm.dart';

part 'product.realm.dart';

@RealmModel()
class _product {
  late String code;
  late String name;
  late double price;
  bool isFav = false;
}
