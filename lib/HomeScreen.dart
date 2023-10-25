import 'package:flutter/material.dart';
import 'package:uts_2020130027/CartScreen.dart';
import 'package:uts_2020130027/ProductScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _listProduk = [
    {
      'Gambar': '/Images/chilli.png',
      'Nama': "Ayam dengan Chili Oil",
      'Harga': 15000,
      'Keterangan':
          "Ayam bagian paha atas atau dada yang lezat dibalut dengan tepung yang renyah, dicocol dengan chili oil yang pedas, asin, gurih",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/bbq.png',
      'Nama': "Ayam dengan Saus BBQ",
      'Harga': 16000,
      'Keterangan':
          "Ayam bagian paha atas atau dada yang lezat dibalut dengan tepung yang renyah, disiram dengan saus BBQ yang gurih dan asin",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/keju.png',
      'Nama': "Ayam dengan Saus Keju",
      'Harga': 16000,
      'Keterangan':
          "Ayam bagian paha atas atau dada yang lezat dibalut dengan tepung yang renyah, dilengkapi dengan saus keju yang gurih",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/sambal.png',
      'Nama': "Ayam dengan Saus Sambal Geprek",
      'Harga': 17000,
      'Keterangan':
          "Ayam bagian paha atas atau dada yang lezat dibalut dengan tepung yang renyah, digeprek dengan sambal bawang yang gurih, pedas, asin, dan wangi",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/spicy.png',
      'Nama': "Ayam dengan Saus Spicy BBQ",
      'Harga': 16000,
      'Keterangan':
          "Ayam bagian paha bawah atau sayap yang lezat dengan baluran tepung yang renyah, disiram dengan saus Spicy BBQ yang pedas",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/volcano.png',
      'Nama': "Ayam dengan Saus Volcano",
      'Harga': 13000,
      'Keterangan':
          "Ayam bagian paha bawah atau sayap yang lezat dengan baluran tepung yang renyah, dilumuri dengan saus volcano yang pedas dan gurih",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/spicy.png',
      'Nama': "Ayam dengan Saus Spicy BBQ",
      'Harga': 16000,
      'Keterangan':
          "Ayam bagian paha bawah atau sayap yang lezat dengan baluran tepung yang renyah, disiram dengan saus Spicy BBQ yang pedas",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
    {
      'Gambar': '/Images/volcano.png',
      'Nama': "Ayam dengan Saus Volcano",
      'Harga': 13000,
      'Keterangan':
          "Ayam bagian paha bawah atau sayap yang lezat dengan baluran tepung yang renyah, dilumuri dengan saus volcano yang pedas dan gurih",
      'Jumlah': 0,
      'Total': 0,
      'sum': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Products",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: _listProduk.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              data: _listProduk[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                child: Image.asset(
                                  _listProduk[index]['Gambar'] ?? '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: Text(
                                  _listProduk[index]['Nama'] ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        backgroundColor: Colors.grey,
        shape: const CircleBorder(),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            border: Border.all(),
          ),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
