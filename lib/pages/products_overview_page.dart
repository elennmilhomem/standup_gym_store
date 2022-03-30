import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/components/app_drawer.dart';
import 'package:standup_gym_store/components/badge.dart';
import 'package:standup_gym_store/components/product_grid.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/product_list.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'STANDUP GYM STORE',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          PopupMenuButton(
            color: const Color(0XFFC7653B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            icon: const Icon(Icons.filter_alt_outlined),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text(
                  'ONLY FAVORITES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text(
                  'ALL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
            builder: (context, cart, child) {
              return Badge(
                value: cart.itemsCount.toString(),
                child: child!,
              );
            },
          ),
        ],
      ),
      body: const ProductGrid(),
      drawer: const AppDrawer(),
    );
  }
}
