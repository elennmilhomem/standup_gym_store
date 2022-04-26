import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/components/app_drawer.dart';
import 'package:standup_gym_store/components/product_item.dart';
import 'package:standup_gym_store/models/product_list.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Color(0xFFCCC5B9),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
              );
            },
          )
        ],
        centerTitle: true,
        title: Text(
          'GERENCIAR PRODUTOS',
          style: GoogleFonts.titilliumWeb(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
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
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
