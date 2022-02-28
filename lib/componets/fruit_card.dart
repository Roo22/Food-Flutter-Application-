import 'package:flutter/material.dart';

double total = 0;

class FruitCard extends StatefulWidget {
  final String fruitname;
  final String fruit;
  final double price;

  FruitCard(
      {required this.fruitname, required this.fruit, required this.price});

  @override
  State<FruitCard> createState() => _FruitCardState();
}

class _FruitCardState extends State<FruitCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1582287104445-6754664dbdb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              '${widget.fruitname}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              '${widget.fruit}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              '${widget.price}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  total = total + widget.price;
                });
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
              mini: true,
            )
          ],
        ),
      ),
    );
  }
}
