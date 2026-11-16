import 'package:material_ui/material_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:minikatalog/components/card_tile.dart';
import 'package:minikatalog/models/products_model.dart';

class CartScreen extends StatefulWidget {
  final List<Data> allProducts;
  final Set<int> cardIds;
  const new({super.key, required this.allProducts, required this.cardIds});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.allProducts.where((element) => widget.cardIds.contains(element.id)).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.white,),

      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: 
            cartProducts.isEmpty ?
            Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey),

              SizedBox(height: 12,),

              Text("Your cart is empty",style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),),
              Text("Add items to start shopping",style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),)
            ],))
            :
            ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final item = cartProducts[index];

                return MiniCardTile(
                  name: item.name!, 
                  tagline: item.tagline!, 
                  price: item.price!, 
                  imageUrl: item.image!,
                  onRemove: () {
                    setState(() {
                      widget.cardIds.remove(item.id);
                    });
                  },
                  ); //buraya eklencek
              })),

          SizedBox(height: 14),

          ElevatedButton(onPressed: () {
            
          }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
              )
            ),
            child: Text("Checkout", style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),))

          ],
        ),
      )),
    );
  }
}