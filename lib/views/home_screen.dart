import 'dart:developer';

import 'package:material_ui/material_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:minikatalog/components/product_card.dart';
import 'package:minikatalog/models/products_model.dart';
import 'package:minikatalog/services/api_services.dart';
import 'package:minikatalog/views/cart_screen.dart';
import 'package:minikatalog/views/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();
  List<Data> allProducts = [];
  bool isLoading = false;
  String errorMessage = "";
  Set<int> cardIds = {};


  Future<void> loadProducts () async {
    try {
      setState(() {
        isLoading = true;
      });
      final productsModel = await apiServices.fetchProducts();
      log("Ürünler getirildi");
      setState(() {
        allProducts = productsModel.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load products";
      });
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),         
                  ),
                  IconButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => 
                        CartScreen(allProducts: allProducts, cardIds: cardIds)
                      )
                    );
                  }, 
                  iconSize: 32,
                  icon: Icon(Icons.shopping_bag_outlined))
              ],
            ),
            SizedBox(height: 8,),
            Text("Find your perfect device",
            style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 14,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search products",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network("https://wantapi.com/assets/banner.png",
              height: 80,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              
              
              ),
            ),
            SizedBox(height: 16,),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ), 
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final findProduct = allProducts[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => 
                          ProductDetailScreen(
                            finalProduct: findProduct, 
                            cardIds: cardIds
                            )
                        ));
                    },
                    
                    child: ProductCard(findProduct: findProduct));
                },
                ),
            ),
          ],
        
        ),
      )),
    );
  }
}