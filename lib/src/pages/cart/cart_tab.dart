import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appdata;
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/pages/widgets/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appdata.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appdata.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: appdata.cartItems.length,
            itemBuilder: (_, index) {
              return CartTile(
                  cartItem: appdata.cartItems[index],
                  remove: removeItemFromCart);
            },
          )),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Total geral',
                    style: TextStyle(
                      fontSize: 12,
                    )),
                Text(utilsServices.priceToCurrency(cartTotalPrice()),
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () async {
                        bool? result = await showOrderConfirmation();

                        if (result ?? false) {
                          // ignore: use_build_context_synchronously
                          showDialog(
                              context: context,
                              builder: (_) {
                                return PaymentDialog(
                                  order: appdata.orders.first,
                                );
                              });
                        }
                      },
                      child: const Text(
                        'Concluir pedido',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Confirmação'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Não')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Sim'))
            ],
          );
        });
  }
}
