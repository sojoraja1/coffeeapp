import 'package:flutter/material.dart';
import 'package:latest/loader.dart';
import 'package:latest/screens/services/auth.dart';

class SignIn extends StatefulWidget {
final Function changeToogle;

SignIn({this.changeToogle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final Authservice authservice = Authservice();
  String email,password,error= '';
  final _formkey = GlobalKey<FormState>();
  bool showloader = false;


  
  @override
  Widget build(BuildContext context) {
     return showloader?Loader(): Scaffold(

      backgroundColor: Colors.brown[100],


      appBar: AppBar(title: Text("SignIn"),
      
        actions: <Widget>[
  FlatButton.icon(onPressed:()=>widget.changeToogle(), icon:Icon(Icons.person), label: Text("Register"))
        ],),
        body: Container(

          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
      
          child:Form(
                  key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 3),borderRadius: BorderRadius.circular(34)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(34)),
                   
                  ),
                   validator: (value)=>value.isEmpty?"please enter email":null,
                  onChanged: (val) {
                  
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                   decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 3),borderRadius: BorderRadius.circular(34)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(34)),
                    
                   
                  ),
                  obscureText: true,
                  validator: (val)=>val.length<6?"password must be longer than 6":null,

                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                 if (_formkey.currentState.validate()) {

                   setState(() {
                     showloader = true;
                   });


         dynamic just =  await authservice. signInWIthEmail(email, password);

         if (just==null) {

           setState(() {
             error = "please enter valid email";
             showloader = false;
           });
           
         }
                     
                   }
                  },
                  
                ),
                        SizedBox(height: 10,),
            Expanded(child: Text("$error")),
              ],
        

          )),
        ),
        );
  }
  
  }