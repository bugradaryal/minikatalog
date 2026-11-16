import 'package:material_ui/material_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:minikatalog/models/products_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data finalProduct;
  final Set<int> cardIds;

  const new({super.key, required this.finalProduct, required this.cardIds});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white, 
     appBar: AppBar(title: Text("Back"), backgroundColor: Colors.white,),
     body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.finalProduct.image!,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.finalProduct.name!, style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold),
              ),
                                    
              SizedBox(height:4,),
              Text(widget.finalProduct.tagline!, style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                overflow: TextOverflow.ellipsis,                   
              ),),
              SizedBox(height: 10,),
              
              Text("Description",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              
              
              SizedBox(height: 4,),
              
              Text(widget.finalProduct.description!, style: TextStyle(
                height: 1.5,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.justify,
              ),
              
              SizedBox(height: 10,),
              
              Text(widget.finalProduct.price!,style: TextStyle(
                fontSize: 22,
                color: Colors.blue.shade800
              
              ),),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  )
                ),
                onPressed:() {
                setState(() {
                  widget.cardIds.add(widget.finalProduct.id!);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Addet to cart"),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    margin: EdgeInsets.only(
                      bottom: 80,
                      left: 20,
                      right: 20
                    ),
                    )

                );

              }, child: Text("Buy now", style: TextStyle(
                fontSize: 16,
                color: Colors.white,

              ),)),




            ],
          ),
        ),

        ],
      )),
    );
  }
}