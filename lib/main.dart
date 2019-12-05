import 'package:flutter/material.dart';
import 'package:babylock/routes.dart' as route;
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: route.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new AfterSplash(),
      image: Image.asset('assets/main/icon_babylock.png'),
      photoSize: 100,
      backgroundColor: Colors.orange,
    );
  }
}

class FirebaseLogin{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height / 1.3;
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main/main_inactivation.jpg'),
            fit: BoxFit.cover
          )
        ),

        child: Container(
          height: deviceHeight,
          
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.count(
          primary: false,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          
          children: <Widget>[
            FlatButton(
              child: Image.asset('assets/main/main_screenlock.png'),
              onPressed: () {},
            ),
            FlatButton(
              child: Image.asset('assets/main/main_unlockalert.png'),
              onPressed: () {},
            ),
            FlatButton(
              child: Image.asset('assets/main/main_playlist.png'),
              onPressed: () {
                Navigator.pushNamed(context, '/playlist');
              },
            ),
            FlatButton(
              child: Image.asset('assets/main/main_bluelight.png'),
              onPressed: () {},
            ),
            FlatButton(
              child: Image.asset('assets/main/main_tutorial.png'),
              onPressed: () {},
            )
          ],
          ),
        ),
      ),
    );
  }
}
