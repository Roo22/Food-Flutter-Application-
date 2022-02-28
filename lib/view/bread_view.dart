import 'package:flutter/material.dart';
import 'package:task_sess3/view/home_view.dart';

import '../componets/fruit_card.dart';

class BreadView extends StatelessWidget {
  const BreadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'EDEKA',
          style: TextStyle(
              color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Product Here',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FruitCard(
                        fruitname: 'Bread', fruit: 'Bergamo Italy', price: 50),
                    SizedBox(
                      height: 10,
                    ),
                    FruitCard(
                        fruitname: 'Croissant',
                        fruit: 'Cattier Italiano',
                        price: 10),
                  ],
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back'))
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Bakery'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BreadView()),
                );
              },
            ),
            ListTile(
              title: const Text('Fruits'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
            ),
            ListTile(
              title: const Text('Vegetables'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Milk'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.air),
            label: 'Total',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (int index) {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );

          print(total);
        },
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Total'),
    content: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${total}'),
      ],
    ),
    actions: [
      new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Close'),
      ),
    ],
  );
}
