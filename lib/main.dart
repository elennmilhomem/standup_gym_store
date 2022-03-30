import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/order_list.dart';
import 'package:standup_gym_store/models/product_list.dart';
import 'package:standup_gym_store/pages/cart_page.dart';
import 'package:standup_gym_store/pages/orders_page.dart';
import 'package:standup_gym_store/pages/product_detail_page.dart';
import 'package:standup_gym_store/pages/products_overview_page.dart';
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black,
            //const Color.fromARGB(255, 40, 41, 42),
            secondary: const Color(0XFFC7653B),
          ),
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Bebas Neue',
        ),
        routes: {
          AppRoutes.HOME: (context) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: ((context) => const ProductDetailPage()),
          AppRoutes.CART: (context) => const CartPage(),
          AppRoutes.ORDERS: (context) => const OrdersPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}