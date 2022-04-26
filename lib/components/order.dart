import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:standup_gym_store/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF252422),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'R\$ ${widget.order.total.toStringAsFixed(2)}',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFFFCF2),
                ),
              ),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFCCC5B9),
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.expand_more,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: widget.order.products.length * 25.0 + 10,
              child: ListView(
                children: widget.order.products.map(
                  (product) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.titilliumWeb(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        Text(
                          '${product.quantity}x  R\$ ${product.price}',
                          style: GoogleFonts.titilliumWeb(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFCCC5B9),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
