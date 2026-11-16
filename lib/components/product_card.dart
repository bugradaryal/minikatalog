import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:minikatalog/models/products_model.dart';

class ProductCard extends StatelessWidget {
  final Data findProduct;
  const new({super.key, required this.findProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(0, 6)
                        ),
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(12),),
                            child: Image.network(findProduct.image!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(findProduct.name!, style: TextStyle(
                                fontWeight: FontWeight.bold),
                              ),
                              
                              SizedBox(height: 2,),
                              Text(findProduct.tagline!, style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                                overflow: TextOverflow.ellipsis,
                              
                              ),),
                              
                              Text(findProduct.price!,
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  );
                
  }
}