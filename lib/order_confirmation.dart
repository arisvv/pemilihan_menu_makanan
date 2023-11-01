import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  final String menuName;
  final double price;
  final int quantity;

  OrderConfirmationPage({
    required this.menuName,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    double total = price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Selesai'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pemesanan Selesai',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              menuName,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Harga: Rp${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Jumlah Pesanan: $quantity',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Total Bayar: Rp${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
