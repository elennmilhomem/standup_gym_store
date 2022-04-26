import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/components/cart_item.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CARRINHO',
          style: GoogleFonts.titilliumWeb(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color(0xFFFFFCF2),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            color: const Color(0xFF252422),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: GoogleFonts.titilliumWeb(
                        textStyle: const TextStyle(
                          color: Color(0xFFFFFCF2),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    child: Text(
                      'COMPRAR',
                      style: GoogleFonts.titilliumWeb(
                        textStyle: const TextStyle(
                          color: Color(0xFF252422),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(),
                      backgroundColor: const Color(0xFFFFA443),
                    ),
                    onPressed: () {
                      Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(cart);

                      cart.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CartItemWidget(
                cartItem: items[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
