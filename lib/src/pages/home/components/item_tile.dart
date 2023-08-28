import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({super.key, required this.item});

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem
                  Expanded(
                      child: Hero(
                          tag: item.imgUrl, child: Image.asset(item.imgUrl))),

                  //Nome do produto
                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  // Preço e unidade
                  Row(
                    children: [
                      Text(utilsServices.priceToCurrency(item.price),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.green)),
                      Text('/${item.unit}',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // Add produto no carrinho
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20))),
                height: 40,
                width: 35,
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
