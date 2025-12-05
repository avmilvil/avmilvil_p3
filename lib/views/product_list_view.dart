import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'main_view.dart';
import '../models/product.dart';
import '../models/products.dart';
import '../widgets/product_tile.dart';

class ProductListView extends StatefulWidget{
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView>{
  late Future<List<Product>> _futureProducts;

  Future<List<Product>> _loadProducts() async{
    final jsonData = await rootBundle.loadString('assets/data/products.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonData);
    final productsContainer = Products.fromJson(jsonMap);

    return productsContainer.products;
  }

  @override
  void initState(){
    super.initState();
    _futureProducts = _loadProducts();
  }

  Future<void> _refresh() async{
    final newList = await _loadProducts();
    setState((){
      _futureProducts = Future.value(newList);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mi Perfil', 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)
              ),
            Image.asset(
              'assets/img/logo.png',
              width: 70,
              height: 70,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (_) => const MainView())
              );
            }, 
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Logout',
          )
        ],
        backgroundColor: Color.fromARGB(255, 173, 217, 210),
        bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: SizedBox()),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snap.hasError){
            return Center(child: Text('Error: ${snap.error}'));
          }

          final products = snap.data ?? [];
          if(products.isEmpty){
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView(
                children: [
                  SizedBox(height: 88),
                  Center(child: Text('No hay productos.'))
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: products.length,
              itemBuilder: (context, i) => ProductTile(product: products[i]),
            ),
          );
        }
      ),
    );
  }
}