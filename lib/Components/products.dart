import 'package:flutter/material.dart';
import 'package:flutter_ecommerceapp/Pages/Product_Details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 6500,
      "discounted_price": 4000,
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 3500,
      "discounted_price": 2500,
    },
    {
      "name": "Shoes",
      "picture": "assets/images/products/shoe1.jpg",
      "old_price": 1200,
      "discounted_price": 1000,
    },
    {
      "name": "Pants",
      "picture": "assets/images/products/pants1.jpg",
      "old_price": 1500,
      "discounted_price": 1250,
    },
    {
      "name": "Skirts",
      "picture": "assets/images/products/skt1.jpeg",
      "old_price": 2500,
      "discounted_price": 2000,
    },
    {
      "name": "Heels",
      "picture": "assets/images/products/hills1.jpeg",
      "old_price": 1200,
      "discounted_price": 850,
    },
    {
      "name": "Shoes",
      "picture": "assets/images/products/skt2.jpeg",
      "old_price": 1200,
      "discounted_price": 1000,
    },
    {
      "name": "Shoes",
      "picture": "assets/images/products/blazer2.jpeg",
      "old_price": 1200,
      "discounted_price": 1000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_Product(
              product_name: product_list[index]['name'],
              product_picture: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_discounted_price: product_list[index]['discounted_price'],
            ),
          );
        });
  }
}

class Single_Product extends StatelessWidget {final product_name;
final product_picture;
final product_old_price;
final product_discounted_price;


  Single_Product({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_discounted_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    product_details_name: product_name,
                    product_details_old_price: product_old_price,
                    product_details_discount_price: product_discounted_price,
                    product_details_picture: product_picture,
                  ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: new Row(children: [
                      Expanded(child:
                      Text(product_name , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),)
                      ),
                      new Text("Rs $product_old_price" , style: TextStyle(color: Colors.blueAccent , fontWeight: FontWeight.bold),)
                    ],)
                  ),
                  child: Image.asset(
                    product_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
