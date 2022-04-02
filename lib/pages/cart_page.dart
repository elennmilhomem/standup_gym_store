import 'package:flutter/material.dart';
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
        title: const Text(
          'CART',
          style: TextStyle(fontSize: 25, color: Color(0xFFFFFCF2)),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Bebas Neue',
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFFFFFCF2),
                        fontFamily: 'Bebas Neue',
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text(
                      'BUY',
                      style: TextStyle(
                        color: Color(0xFF252422),
                        fontFamily: 'Bebas Neue',
                        fontSize: 20,
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
