import 'dart:math';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductTile extends StatefulWidget{
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile>{
  bool _flipped = false;

  void _toggleCard(){
    setState(() {
      _flipped = !_flipped;
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation){
          final angle = animation.value * pi;
          final isBack = (child.key is ValueKey && (child.key as ValueKey).value.toString().startsWith('back_'));
          final finalAngle = isBack ? angle - pi : angle;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(finalAngle),
            alignment: Alignment.center,
            child: child,
          );
        },
        child: _flipped
          ? _buildBack(key: ValueKey('back_${widget.product.name}'))
          : _buildFront(key: ValueKey('front_${widget.product.name}')),
      ),
    );
  }

  Widget _buildFront({required Key key}){
    final p = widget.product;
    return Container(
      key: key,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
            child: Image.asset(
              p.image,
              width: 100,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 100, 
                height: 150, 
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.name, 
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      p.description, 
                      maxLines: 4, 
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '€ ${p.price.toStringAsFixed(2)}', 
                    style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildBack({required Key key}){
    final p = widget.product;
    return Container(
      key: key,
      alignment: Alignment.center,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p.name, 
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(child: SingleChildScrollView(child: Text(p.description))),
          const SizedBox(height: 6),
          Text(
            'Precio: € ${p.price.toStringAsFixed(2)}', 
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}