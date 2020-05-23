import 'package:firebase/screens/login_screen.dart';
import 'package:firebase/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
   static final String id = "signup_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

   String _name, _email, _password;
   // code ya Kuvalidate forms 
    final _formKey = GlobalKey<FormState>();

    //Method ya  kuvalidate form na Signup user
   _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Hapa Tunacall class auth_service.dart ndio tuchukue details za kulogin
       AuthService.signUpUser(context, _name, _email, _password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: <Widget>[
            Container(
      height: 270.0,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 50.0),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      color: Colors.blueGrey,
            ),
            Form(
              key: _formKey,
        child: Column(
      children: <Widget>[
          Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (name) =>
                            name.trim().isEmpty ? 'Enter valid name' : null,
                        onSaved: (name) => _name = name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) =>  !email.contains('@')
                            ? 'Email is invalid'
                            : null,
                        onSaved: (email) => _email = email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                        ),
                        obscureText: true,
                        validator: (password) => password.length < 5
                            ? 'Password mut be atleast 5 characters'
                            : null,
                        onSaved: (password) => _password = password,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
        Container(
          width: 340.0,
          height: 45.0,
          child: FlatButton(
            onPressed: () {

            // calling the submit button


              _submit();


            },
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0)
            ),
            color: Colors.blueGrey,
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Register',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
         height: 20.0,
        ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Have and Account?"),
            FlatButton(
              onPressed: (){
               Navigator.pushReplacementNamed(context, LoginScreen.id);
              }, child: Text('Login')
              ),
          ],
         ),
      ],
            ))
          ],
        ),
    );
  }
}
