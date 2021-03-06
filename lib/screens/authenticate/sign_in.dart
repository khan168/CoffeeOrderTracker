import 'package:brew_crew/services/Auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  late final Function toggleView;
  SignIn({required this.toggleView});



  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email='';
  String password='';
  String error='';
  final _formkey = GlobalKey<FormState>();
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title:Text('Sign in to Brew Crew'),
        actions: [
          FlatButton.icon(
          onPressed: (){
            widget.toggleView();
          },
          icon: Icon(Icons.person),
          label: Text('Register'),
        )],


      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator:(val)=> val!.isEmpty? 'Enter an email':null,
                onChanged:(val){
                  setState(()=>email=val);

                } ,

              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator:(val)=> val!.length<6?'Length should be atleast 6':null,
                obscureText: true,
                onChanged:(val){
                  setState(()=>password=val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      setState(()=>loading=true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() {
                          error = 'Could not sign in with those credentials';
                          loading=false;
                        });
                      }
                    }
                  }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),


            ],
          ),
        )
      ),
    );
  }
}
