import 'package:flutter/material.dart';
import 'package:simple_shoes_app/global_variables.dart';
import 'package:simple_shoes_app/product_card.dart';
import 'package:simple_shoes_app/product_details_page.dart';
import 'package:flutter/foundation.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductList();
}

class _ProductList extends State<ProductList> {
  final List<String> filters = ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;
  final border = OutlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.solid,
      color: Colors.black54,
    ),
    borderRadius: BorderRadius.circular(35),
  );

  @override
  void initState() {
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Shoes\n Collection",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black54,
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filters[index];
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filters[index]
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(226, 229, 232, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      label: Text(filters[index]),
                      labelStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      side: BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProduvtDetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    assetImage: product['imageURL'] as String,
                    bgColor: index.isEven
                        ? Color.fromARGB(218, 209, 214, 217)
                        : Color.fromARGB(218, 151, 187, 208),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
