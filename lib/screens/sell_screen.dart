import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_marketplace/model/chatModel.dart';
import 'package:whatsapp_marketplace/provider/product_provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key, required this.chatUser});
  final ChatModel chatUser;
  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // List of items in our dropdown menu
    Size size = MediaQuery.of(context).size;
    print('USer is ${widget.chatUser.name} and id ${widget.chatUser.id}');
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
              // CircleAvatar(
              //   child: Icon(Icons.groups, color: Colors.white, size: 38),
              //   backgroundColor: Colors.black38,
              //   radius: 20,
              // )
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
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height - 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sell Products",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.050,
                    letterSpacing: 0.5,
                  ),
                ),
                Center(
                  child: Image.network(
                    "https://appleasia.lk/wp-content/uploads/2023/03/iPhone-14-Pro-Max-Apple-Asia-Srilanka-Purple-1.webp",
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                    TextField(
                      controller: _productNameController,
                      //  decoration: InputDecoration(labelText: 'Product Name'),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Price",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                    TextField(
                      controller: _priceController,
                      // decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    String productName = _productNameController.text;
                    String price = _priceController.text;
                    print('Product Name: $productName, Price: $price');
                    context.read<ProductProvider>().addItem(
                        productName, double.parse(price), widget.chatUser.name);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.grey.withOpacity(0.8),
                        content: const Text(
                          "Item Added to Market Succesfully!",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Sell",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
