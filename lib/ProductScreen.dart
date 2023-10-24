import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2020130027/produk_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = "1";
  }

  int counter = 1;
  void _incrementCounter() {
    setState(() {
      counter++;
      _controller.text = '$counter';
    });
  }

  void _decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
        _controller.text = '$counter';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProdukProvider>(builder: (context, provider, child) {
        return ListView(
          children: [
            Column(
              children: [
                Image.asset(widget.data['Gambar'] ?? 'Tidak ada'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.data['Nama'] ?? 'Tidak ada',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.data['Harga'].toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Text(
                  widget.data['Keterangan'] ?? 'Tidak ada',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          _decrementCounter();
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          _incrementCounter();
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          widget.data['Jumlah'] = int.parse(_controller.text);
                          widget.data['Total'] = int.parse(_controller.text) *
                              widget.data['Harga'];
                          provider.addProduct(widget.data);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
