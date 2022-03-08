import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This w idget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<dataModelUser?>.value(
      catchError:  (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );

  }
}


