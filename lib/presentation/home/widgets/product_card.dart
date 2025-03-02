import 'package:flutter/material.dart';
import 'package:meca_inventory/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            color: Colors.grey,
          ),
          Column(
            children: [
              Text(
                product.name,
              ),
              RichText(
                text: const TextSpan(
                  text: 'costo:',
                  style: TextStyle(
                    color: Colors.black, // Color de la primera parte
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: '500', // Segunda parte del texto
                      style: TextStyle(
                        fontStyle: FontStyle.italic, // Cursiva
                        color: Colors.grey, // Color azul
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Text('cantidad: 0/10')
            ],
          )
        ],
      ),
    );
  }
}
