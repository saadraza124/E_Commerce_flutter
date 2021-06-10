import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerceapp/Pages/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void login() async{
    //if(_formKey.currentState.validate()){
    // _formKey.currentState.save();

    // _email='saad199raza@gmail.com';
    //  _password='123456';
    try{
      //print(_emailTextController);
     // print(_passwordTextController);
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text);
      //print("login");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }catch(e){
      print(e.message);
    }
  }



  void isSignedIn() async {
    setState(() {
      loading = true;
    });

      User user = firebaseAuth.currentUser; {
        if(user != null){
          setState(() => isLogedin = true);
        }
      }


    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    User firebaseuser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseuser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseuser.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        // insert the user to our collection
        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseuser.uid)
            .set({
          "id": firebaseuser.uid,
          "username": firebaseuser.displayName,
          "profilePic": firebaseuser.photoURL
        });
        await preferences.setString("id", firebaseuser.uid);
        await preferences.setString("username", firebaseuser.displayName);
        await preferences.setString("photoUrl", firebaseuser.displayName);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Login was Successful");
      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/dressing.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
            color: Colors.black.withOpacity(0.6),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/logo.png',
                width: 280.0, height: 240.0),
          ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:250.0),
                child: Center(
                      child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14.0 , 8.0 , 14.0 , 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.8),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: TextFormField(
                                      controller: _emailTextController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        icon: Icon(Icons.email_outlined),
                                          border: InputBorder.none
                                      ),
                                      // ignore: missing_return
                                      validator: (value) {
                                        if(value.isEmpty) {
                                          Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14.0 , 8.0 , 14.0 , 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.8),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: TextFormField(
                                      controller: _passwordTextController,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                          border: InputBorder.none
                                      ),
                                      // ignore: missing_return
                                      validator: (value){
                                        if(value.isEmpty) {
                                          return "Please Enter Password" ;
                                        }else if(value.length < 6){
                                          return " Password must be alteast 6 Characters";
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14.0 , 8.0 , 14.0 , 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.blueAccent,
                                  elevation: 0.0,
                                  child: MaterialButton(onPressed: login,
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text("Login" , textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 20.0 ),),)
                                ),
                              ),
                             Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Forgot Password" , textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                                 ),
                             ),
                             // Expanded(child: Container()),

                              Padding(padding: const EdgeInsets.all(8.0),
                              child : InkWell(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                  } ,
                                  child: Text("Sign up" , textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),))
                              ),
                            ],
                          )
                      )
                ),
              ),
            ),


          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
