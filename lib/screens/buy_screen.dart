import 'package:flutter/material.dart';
import 'package:whatsapp_marketplace/model/productModel.dart';
import 'package:whatsapp_marketplace/provider/product_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('Clicked ${widget.product.name}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.060,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Order Details",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.040,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /////
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.30,
                                height: size.height * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Image.network(
                                    widget.product.image,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.product.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: size.width * 0.035,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Text(
                                      "\$${widget.product.price}",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: size.width * 0.035,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.width * 0.030,
                                    ),
                                    Text(
                                      "Sold by ${widget.product.seller}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.width * 0.035,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Info",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.040,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.010,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: GoogleFonts.poppins(),
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: GoogleFonts.poppins(),
                      ),
                      Text(
                        "Free",
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.055,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<ProductProvider>().buyItem(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.grey.withOpacity(0.8),
                            content: const Text(
                              "Item Purchased Succesfully!",
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
                          "Checkout (\$${widget.product.price})",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
