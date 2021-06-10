import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// my packages
import 'package:flutter_ecommerceapp/Components/Horizontal_ListView.dart';
import 'package:flutter_ecommerceapp/Components/products.dart';
import 'package:flutter_ecommerceapp/Pages/Cart.dart';
import 'package:flutter_ecommerceapp/Pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 210.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/images/m1.jpeg'),
        AssetImage('assets/images/c1.jpg'),
        AssetImage('assets/images/m2.jpg'),
        AssetImage('assets/images/w3.jpeg'),
        AssetImage('assets/images/w4.jpeg'),
      ],
      autoplay: false,
    //  animationCurve: Curves.fastOutSlowIn,
    //  animationDuration: Duration(microseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
      dotBgColor: Colors.transparent,
    ),
  );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blueAccent,
        title: Text('DressUp'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new shop_cart()));
          })
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          // D R A W E R____H E A D E R
          new UserAccountsDrawerHeader(
              accountName: Text('Zain Haider'),
              accountEmail: Text('zain557766@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color : Colors.white),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.blueAccent
            ),
          ),
          // D R A W E R____B O D Y
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home , color: Colors.blueAccent),

            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person , color: Colors.blueAccent),

            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket , color: Colors.blueAccent),

            ),
          ),

          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new shop_cart()));},
            child: ListTile(
              title: Text('Shopping Cart'),
              leading: Icon(Icons.shopping_cart , color: Colors.blueAccent,),

            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite , color: Colors.red,),

            ),
          ),
          Divider(),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),

            ),
          ),


          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.info ),

            ),
          ),

          InkWell(
            onTap: (){
              FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage())));
            },
            child: ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.transit_enterexit , color: Colors.grey,),
            ),
          )


        ],
      )
      ),

      // D R A W E R___B O D Y___E N D S
      body: Column(
        children: <Widget>[
          // I M A G E____C A R O U S E L
          //image_carousel,
          //P A D D I N G___W I D G E T
          new Padding(padding: const EdgeInsets.all(4.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Categories')),),

          // H O R I Z O N T A L___L I S T___V I E W

          HorizontalList(),


          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent Products')),),

          // G R I D___V I E W

          Flexible(

            child: Products(),
          )


        ],
      ),
    );
  }
}
