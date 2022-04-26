import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/order_list.dart';
import 'package:standup_gym_store/models/product_list.dart';
import 'package:standup_gym_store/pages/cart_page.dart';
import 'package:standup_gym_store/pages/orders_page.dart';
import 'package:standup_gym_store/pages/product_detail_page.dart';
import 'package:standup_gym_store/pages/product_form_page.dart';
import 'package:standup_gym_store/pages/products_overview_page.dart';
import 'package:standup_gym_store/pages/products_page.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'STANDUP GYM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF403D39),
            secondary: const Color(0XFFFFA443),
          ),
          scaffoldBackgroundColor: const Color(0xFF403D39),
        ),
        routes: {
          AppRoutes.HOME: (context) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: ((context) => const ProductDetailPage()),
          AppRoutes.CART: (context) => const CartPage(),
          AppRoutes.ORDERS: (context) => const OrdersPage(),
          AppRoutes.PRODUCTS: (context) => const ProductsPage(),
          AppRoutes.PRODUCT_FORM: (context) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
