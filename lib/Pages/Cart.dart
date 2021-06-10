import 'package:flutter/material.dart';

// my packages
import 'package:flutter_ecommerceapp/Components/cart_products.dart';

class shop_cart extends StatefulWidget {
  @override
  _shop_cartState createState() => _shop_cartState();
}

class _shop_cartState extends State<shop_cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      elevation: 0.1,
      backgroundColor: Colors.blueAccent,
      title: Text('Cart'),
      actions: <Widget>[
        new IconButton(icon: Icon(Icons.search), onPressed: () {}),

      ],
    ),
      body: new cart_prod(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("Rs500"),
            )),

            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("Check out" , style: TextStyle(color: Colors.white),),
              color: Colors.blueAccent,
              ),
              
            )

          ],
        ),
      ),
    );
  }
}
