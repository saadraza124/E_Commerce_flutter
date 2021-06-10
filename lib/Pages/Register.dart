import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../DataBase/Users.dart';
import 'home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmpasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String gender;
  String groupValue = "male";
  bool loading = false;
  bool HidePassword = true;

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
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                      hintText: "Full name",
                                      icon: Icon(Icons.person_outline),
                                      border: InputBorder.none),
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter Name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      icon: Icon(Icons.email_outlined),
                                      border: InputBorder.none),
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: new Container(
                              color: Colors.white.withOpacity(0.8),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: ListTile(
                                          title: Text(
                                            "male",
                                            textAlign: TextAlign.end,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          trailing: Radio(
                                              value: "male",
                                              groupValue: groupValue,
                                              onChanged: (e) =>
                                                  valueChanged(e)))),
                                  Expanded(
                                      child: ListTile(
                                          title: Text(
                                            "female",
                                            textAlign: TextAlign.end,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          trailing: Radio(
                                              value: "female",
                                              groupValue: groupValue,
                                              onChanged: (e) =>
                                                  valueChanged(e)))),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    controller: _passwordTextController,
                                    obscureText: HidePassword,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                        border: InputBorder.none),
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please Enter Password";
                                      } else if (value.length < 6) {
                                        return " Password must be alteast 6 Characters";
                                      }
                                      return null;
                                    },
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        HidePassword = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    controller: _confirmpasswordTextController,
                                    obscureText: HidePassword,
                                    decoration: InputDecoration(
                                        hintText: "Confirm password",
                                        icon: Icon(Icons.lock_outline),
                                        border: InputBorder.none),
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please enter password";
                                      } else if (value.length < 6) {
                                        return " Password must be alteast 6 characters";
                                      } else if (_passwordTextController.text !=
                                          value) {
                                        return "Password do not match";
                                      }
                                      return null;
                                    },
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        HidePassword = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blueAccent,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () async {
                                    validateForm();
                                  },
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Sign up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                )),
                          ),
                          // Expanded(child: Container()),

                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red),
                                  ))),
                        ],
                      ))),
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

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
  FormState formState = _formKey.currentState;
  Map value;

  if(formState.validate()){
    formState.reset();
    User user = firebaseAuth.currentUser;
    if (user == null) {
      firebaseAuth.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((user) => {

        _userServices.createUser(
             {
              "username" : _nameTextController,
               "email" :   _emailTextController,
               "userId" : user.user.uid,
               "gender" : gender,
            }
        )
      }).catchError((error) => {print(error.toString())});

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
  }
}

