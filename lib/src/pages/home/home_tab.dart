import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/pages/home/components/category_tile.dart';
import 'package:greengrocer/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:
            const Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
          TextSpan(
              text: 'Green',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'grocer',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        ])),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              child: const Badge(
                  label: Text('2'),
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  )),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          //pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquisa',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),

          // categorias
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory = appData.categories[index];
                        });
                      },
                      category: appData.categories[index],
                      isSelected:
                          appData.categories[index] == selectedCategory);
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: appData.categories.length),
          ),
          // grid
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5),
                itemCount: appData.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(item: appData.items[index]);
                }),
          )
        ],
      ),
    );
  }
}
