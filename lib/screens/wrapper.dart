import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final u = Provider.of<dataModelUser?>(context);

    //return either home or authenticate widget
    if (u==null){
      return const Authenticate();
    }else{
      return  Home();
    }
  }
}
