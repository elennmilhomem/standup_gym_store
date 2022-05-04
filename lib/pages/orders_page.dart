import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/components/app_drawer.dart';
import 'package:standup_gym_store/components/order.dart';
import 'package:standup_gym_store/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'MEUS PEDIDOS',
          style: GoogleFonts.titilliumWeb(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(
          context,
          listen: false,
        ).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.error != null) {
            return Center(
              child: Text(
                'Ocorreu um erro!',
                style: GoogleFonts.titilliumWeb(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFCF2),
                  ),
                ),
              ),
            );
          } else {
            return Consumer<OrderList>(
              builder: (context, orders, child) => ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: (context, index) => OrderWidget(
                  order: orders.items[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
