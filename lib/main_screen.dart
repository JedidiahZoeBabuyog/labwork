import 'package:flutter/material.dart';
import 'package:monday_labwork/models/product.dart';
import 'package:provider/provider.dart';
import 'package:monday_labwork/provider/item_provider.dart';

class MainScreen extends StatelessWidget {
  var codeCtrl = TextEditingController();
  var priceCtrl = TextEditingController();
  var nameCtrl = TextEditingController();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (context, products, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('View Products'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            IconButton(
              onPressed: () {
                add(context);
              },
              icon: Icon(Icons.add),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        body: ListView.builder(
            itemCount: products.products.length,
            itemBuilder: (_, index) {
              var items = products.products[index];
              return Card(
                child: ListTile(
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined)),
                  leading: IconButton(
                      onPressed: () {
                        products.toggleFav(items);
                      },
                      icon: items.isFav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_outlined)),
                  title: Text(items.name),
                ),
              );
            }),
      );
    });
  }

  void add(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  toAdd(context);
                },
                child: Text('Add Item'),
              ),
            ],
            title: Text('Add Item'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: codeCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Code',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name/Description',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: priceCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Price',
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void toAdd(BuildContext context) {
    var items =
        product(codeCtrl.text, nameCtrl.text, double.parse(priceCtrl.text));
    Provider.of<Products>(context, listen: false).add(items);

    Navigator.of(context).pop();
  }
}
