import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/auth.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/order_list.dart';
import 'package:standup_gym_store/models/product_list.dart';
import 'package:standup_gym_store/pages/auth_or_home_page.dart';
import 'package:standup_gym_store/pages/cart_page.dart';
import 'package:standup_gym_store/pages/orders_page.dart';
import 'package:standup_gym_store/pages/product_detail_page.dart';
import 'package:standup_gym_store/pages/product_form_page.dart';
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
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList('', []),
          update: (context, auth, previous) {
            return ProductList(
              auth.token ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
            create: (_) => OrderList('', []),
            update: (context, auth, previous) {
              return OrderList(auth.token ?? '', previous?.items ?? []);
            }),
        ChangeNotifierProvider(
          create: (_) => Cart(),
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
          AppRoutes.AUTH_OR_HOME: (context) => const AuthOrHomePage(),
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
