import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seewe/provider/google_sign_in.dart';
import 'package:provider/provider.dart';


class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final GoogleSignInAccount googleSignInAccount =
    final user = FirebaseAuth.instance.currentUser;
    
    return Container(
      alignment: Alignment.center,
      color: Colors.lightBlueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}


//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
/*

GoogleSignIn googleSignIn = GoogleSignIn();


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>  {
  Future <GoogleSignInAccount> googleSignInAccount = googleSignIn.signIn();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
            "",
        style: TextStyle(color: Colors.green, fontSize: 20),
      )),
    );
  }
}
*/
