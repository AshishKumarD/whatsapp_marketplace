import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_marketplace/model/chatModel.dart';
import 'package:whatsapp_marketplace/model/productModel.dart';
import 'package:whatsapp_marketplace/provider/cart_provider.dart';
import 'package:whatsapp_marketplace/screens/cart_screen.dart';
import 'package:whatsapp_marketplace/screens/sell_screen.dart';
import 'package:whatsapp_marketplace/widgets/product_widget.dart';
import 'package:whatsapp_marketplace/provider/product_provider.dart';
import 'package:whatsapp_marketplace/widgets/category_header.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key, required this.chatUser});

  final ChatModel chatUser;
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  var search = '';
  final TextEditingController _productNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MarketPlace',
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SellScreen(chatUser: widget.chatUser)));
              },
              icon: const Icon(Icons.add)),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(
                      Iconsax.bag,
                      // color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -3,
                  child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 10,
                          child: Text(
                            context
                                .watch<CartProvider>()
                                .shoppingCart
                                .length
                                .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Latest Products",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.050,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              SizedBox(
                width: size.width,
                child: TextFormField(
                  controller: _productNameController,
                  onChanged: (text) {
                    setState(() {
                      search = text; // Update the entered text
                    });
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black38,
                    isCollapsed: false,
                    hintText: "Search Products",
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.040,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Column(
                children: [
                  CategoryHeader(
                    title: 'Products',
                    count:
                        '${Provider.of<ProductProvider>(context).products.length}',
                  ),
                  SizedBox(
                    height: size.height * 0.020,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Consumer<ProductProvider>(
                      builder: (context, value, child) {
                        // Search
                        List<ProductModel> filteredProducts = value.products
                            .where((product) =>
                                product.name.toLowerCase().contains(search))
                            .toList();

                        return Column(
                          children: filteredProducts
                              .map((product) => ProductCard(
                                    product: product,
                                  ))
                              .toList(),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
