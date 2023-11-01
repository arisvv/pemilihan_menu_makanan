import 'package:flutter/material.dart';
import 'order_confirmation.dart';

class MenuDetailPage extends StatefulWidget {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  MenuDetailPage({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  _MenuDetailPageState createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = widget.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              widget.imagePath,
              width: 150,
              height: 150,
            ),
            Text(
              'Nama Menu: ${widget.name}',
            ),
            Text(
              'Deskripsi: ${widget.description}',
            ),
            Text(
              'Harga: Rp${total.toStringAsFixed(2)}',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementQuantity,
                  child: Text('-'),
                ),
                SizedBox(width: 10),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementQuantity,
                  child: Text('+'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderConfirmationPage(),
                  ),
                );
              },
              child: Text('PESAN'),
            ),
          ],
        ),
      ),
    );
  }
}
