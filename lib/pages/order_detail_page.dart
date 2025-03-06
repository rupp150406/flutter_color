import 'package:flutter/material.dart';
import 'package:tiket_wisata/models/product_model.dart';

class OrderDetailPage extends StatelessWidget {
  final Product product;

  const OrderDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(product.description),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga: Rp ${product.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => _showPaymentDialog(context),
                  child: Text('Bayar Sekarang'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Pilih Metode Pembayaran'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.qr_code),
                  title: Text('Bayar dengan QRIS'),
                  onTap: () => _showQrisPaymentDialog(context),
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Bayar Tunai'),
                  onTap: () => _showCashPaymentDialog(context),
                ),
              ],
            ),
          ),
    );
  }

  void _showQrisPaymentDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Bayar dengan QRIS'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://via.placeholder.com/150',
                ), // Ganti dengan gambar QRIS asli
                SizedBox(height: 8),
                Text('Scan QR Code untuk membayar'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Tutup'),
              ),
            ],
          ),
    );
  }

  void _showCashPaymentDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Bayar Tunai'),
            content: Text(
              'Silakan lakukan pembayaran tunai kepada petugas di loket.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Tutup'),
              ),
            ],
          ),
    );
  }
}
