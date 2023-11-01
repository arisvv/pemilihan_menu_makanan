import 'package:flutter/material.dart';
import 'menu_detail.dart';

void main() {
  runApp(MyApp());
}

class MenuItem {
  String name;
  String description;
  double price;
  String imagePath;

  MenuItem(
      {required this.name,
      required this.description,
      required this.price,
      required this.imagePath});
}

class MyApp extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        name: "Nasi Goreng",
        description: "Nasi goreng dengan telur dan sayuran",
        price: 13000,
        imagePath: "assets/nasi_goreng.jpg"),
    MenuItem(
        name: "Mie Goreng",
        description: "Mie goreng dengan ayam dan sayuran",
        price: 11000,
        imagePath: "assets/mie_goreng.jpg"),
    MenuItem(
        name: "Ayam Bakar",
        description: "Ayam bakar dengan nasi dan sambal",
        price: 12000,
        imagePath: "assets/ayam_bakar.jpg"),
    MenuItem(
        name: "Sate Ayam",
        description: "Sate ayam dengan bumbu kacang",
        price: 10000,
        imagePath: "assets/sate_ayam.jpg"),
  ];

  void _navigateToDetail(BuildContext context, MenuItem menuItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuDetailPage(
          name: menuItem.name,
          description: menuItem.description,
          price: menuItem.price,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu Makanan'),
        ),
        body: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(
                menuItems[index].imagePath,
                width: 50,
                height: 50,
              ),
              title: Text(menuItems[index].name),
              subtitle: Text(menuItems[index].description),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${menuItems[index].price.toStringAsFixed(2)}'),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToDetail(context, menuItems[index]);
                    },
                    child: Text('Pesan'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
