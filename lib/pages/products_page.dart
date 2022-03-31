import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/components/app_drawer.dart';
import 'package:standup_gym_store/components/product_item.dart';
import 'package:standup_gym_store/models/product_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Manage Products',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (context, index) => Column(
                  children: [
                    ProductItem(product: products.items[index]),
                    const Divider(
                      color: Colors.white,
                    ),
                  ],
                )),
      ),
    );
  }
}
