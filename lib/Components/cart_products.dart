import 'package:flutter/material.dart';

class cart_prod extends StatefulWidget {
  @override
  _cart_prodState createState() => _cart_prodState();
}

class _cart_prodState extends State<cart_prod> {
  var items_on_cart = [
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "discounted_price": 4000,
      "size": "M",
      "color": "Red",
      "quantity": "2",
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress1.jpeg",
      "discounted_price": 2500,
      "size": "S",
      "color": "Blue",
      "quantity": "3",
    },
    {
      "name": "Shoes",
      "picture": "assets/images/products/shoe1.jpg",
      "discounted_price": 1000,
      "size": "7",
      "color": "Black",
      "quantity": "2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items_on_cart.length,
        itemBuilder: (context, index) {
          return new Single_cart_prod(
            cart_product_name: items_on_cart[index]["name"],
            cart_product_color: items_on_cart[index]["color"],
            cart_product_qty: items_on_cart[index]["quantity"],
            cart_product_size: items_on_cart[index]["size"],
            cart_product_discounted_price: items_on_cart[index]
                ["discounted_price"],
            cart_product_picture: items_on_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_prod extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_discounted_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  Single_cart_prod(
      {this.cart_product_name,
      this.cart_product_picture,
      this.cart_product_discounted_price,
      this.cart_product_size,
      this.cart_product_color,
      this.cart_product_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // L E A D I N G________S E C T I O N
        leading: new Image.asset(cart_product_picture, width: 100.0, height: 100.0,),

        // T I T L E___S E C T I O N
        title: new Text(cart_product_name),

        // S U B T I T L E___S E C T I O N
        subtitle: new Column(
          children: <Widget>[
            // ROW INSIDE COLUMN
            new Row(
              children: <Widget>[
                // S I Z E__O F__P R O D U C T S
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),

                // C O L O R__O F__P R O D U C T S
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_color,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),

                // P R I C E__O F__P R O D U C T S
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "Rs.$cart_product_discounted_price",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            )
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child:
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.blueAccent),iconSize: 90, onPressed: () {}),
              Text('$cart_product_qty',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.blueAccent,),iconSize: 90, onPressed: () {}),

            ],
          ),
        ),
    )
    );
  }
}
