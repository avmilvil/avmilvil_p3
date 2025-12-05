import 'package:avmilvil_p2/views/product_list_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget{
  const MainView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Login', 
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)
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
      body: Center(
        child: Column(
          children: [
            Container(
              width: 160,
              height: 160, 
              margin: EdgeInsets.all(50),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 173, 217, 210),
              ),  
              child: const Center(
                child: Text("👤", style: TextStyle(fontSize: 80)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text("👤", style: TextStyle(fontSize: 30),),
                    ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text("🔒", style: TextStyle(fontSize: 30),),
                    ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 173, 217, 210),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_) => const ProductListView())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}