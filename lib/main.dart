import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seewe/pages/account_page.dart';
import 'package:seewe/pages/home_page.dart';
import 'package:seewe/provider/google_sign_in.dart';
import 'package:seewe/widget/background_painter.dart';
import 'package:seewe/widget/sign_up_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context)=>GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            final provider = Provider.of<GoogleSignInProvider>(context);
            if (provider.isSigningIn){
              return buildLoading();
            } else if (snapshot.hasData){
              return HomePage();
            } else {
              return SignUpWidget();
            }
          },
        ),
      ),
    );
  }
  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      CustomPaint(painter: BackgroundPainter()),
      Center(child: CircularProgressIndicator()),
    ],
  );
}


