import 'package:avmilvil_p2/views/main_view.dart';
import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/item_tile.dart';

class ListViewPage extends StatelessWidget{
  const ListViewPage({super.key});

  List<Item> _generateSampleItems() {
    return List.generate(25, (i) {
      final id = 'item_$i';
      final imageIndex = (i % 10) + 1;
      final imageUrl = 'assets/sample_$imageIndex.png';
      return Item(
        id: id,
        title: 'Elemento #${i+1}',
        description: 'Descripción breve del elemento $i para mostrar en la lista.',
        imageUrl: imageUrl,
        extra: 'Extra ${i+1}',
      );
    });
  }

  @override
  Widget build(BuildContext context){
    final items = _generateSampleItems();
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
        backgroundColor: Color.fromARGB(255, 173, 217, 210),
        bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: SizedBox()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Container(
                  width: 160,
                  height: 160, 
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 173, 217, 210),
                  ),  
                  child: const Center(child: Text("👤", style: TextStyle(fontSize: 80))),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Bienvenido a tu perfil!',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Text(
                    'Toca un elemento para ver su detalle (se implementará en la Fase 3).',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          }

          final item = items[index - 1];
          return ItemTile(
            item: item,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Detalle: se implementará en la Fase 3 (ítem: ${item.title})'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 173, 217, 210),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainView()));
        },
        label: const Text('Sign out', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.logout, color: Colors.white),
      ),
    );
  }
}