import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_discount_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails(
      {this.product_details_name,
      this.product_details_discount_price,
      this.product_details_old_price,
      this.product_details_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blueAccent,
        title: InkWell(
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>new HomePage()));},
            child: Text('DressUp')),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),

        ],
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_details_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_details_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\Rs ${widget.product_details_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\Rs ${widget.product_details_discount_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          // P R O D U C T______P A G E____________B U T T O N S

          Row(
            children: <Widget>[
              // S I Z E___B U T T O N
             Expanded(
                 child: MaterialButton(
                   onPressed: () {
                     showDialog(context: context,
                     builder: (context){
                       return new AlertDialog(
                         title: new Text("Size"),
                         content: new Text("Choose Size"),
                         actions: <Widget> [
                           new MaterialButton(onPressed: (){
                             Navigator.pop(context);
                           },
                             child: new Text("close"),
                           )
                         ],
                       );
                     }
                     );
                   },
                   color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,
                   child: Row(
                     children: <Widget>[
                       Expanded(
                         child: new Text('Size'),
                       ),
                       Expanded(
                         child: new Icon(Icons.arrow_drop_down),
                       )
                     ],
                   ),
                 )
             ),

              // C O L O R____B U T T O N

              Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(context: context,
                          builder: (context){
                            return new AlertDialog(
                              title: new Text("Color"),
                              content: new Text("Choose Color"),
                              actions: <Widget> [
                                new MaterialButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                  child: new Text("close"),
                                )
                              ],
                            );
                          }
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text('Color'),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  )
              ),

              // Q U A N T I T Y____B U T T O N

              Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(context: context,
                          builder: (context){
                            return new AlertDialog(
                              title: new Text("Quantity"),
                              content: new Text("Choose Quantity"),
                              actions: <Widget> [
                                new MaterialButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                  child: new Text("close"),
                                )
                              ],
                            );
                          }
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text('Qty'),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),

          Row(
            children: <Widget>[
              // S I Z E___B U T T O N
              Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy Now"),
                  )
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.blueAccent,), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border,color: Colors.blueAccent), onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(),

          // P R O D U C T___N A M E___B R A N D___A N D___C O N D I T I O N
          new Row(
            children: <Widget> [
              Padding(padding: const EdgeInsets.fromLTRB(12, 5 , 5 , 5),
              child: new Text("Product Name ", style: TextStyle(color: Colors.grey),),),

              Padding(padding: const EdgeInsets.all(5),
              child: new Text(widget.product_details_name),)




            ],
          ),
          new Row(
            children: <Widget> [
              Padding(padding: const EdgeInsets.fromLTRB(12, 5 , 5 , 5),
                child: new Text("Product Brand ", style: TextStyle(color: Colors.grey),),),

              Padding(padding: const EdgeInsets.all(5),
                child: new Text("Brand XYZ"),)




            ],
          ),

          new Row(
            children: <Widget> [
              Padding(padding: const EdgeInsets.fromLTRB(12, 5 , 5 , 5),
                child: new Text("Product Condition ", style: TextStyle(color: Colors.grey),),),

              Padding(padding: const EdgeInsets.all(5),
                child: new Text(" New "),)




            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar Products" , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          ),
          // S I M I L A R___P R O D U C T S
          Container(
            height: 340.0,
            child: Similar_Products(),
          )
        ],
      ),
    );
  }
}
class Similar_Products extends StatefulWidget {
  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 6500,
      "discounted_price": 4000,
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

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_Product(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_discounted_price: product_list[index]['discounted_price'],
          );
        });
  }
}

class Similar_Single_Product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_discounted_price;

  Similar_Single_Product({
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

